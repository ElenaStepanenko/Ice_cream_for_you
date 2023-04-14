import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/repositories/shop/models/shops_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SearchBar extends StatefulWidget {
  final Completer<YandexMapController> mapController;
  const SearchBar({super.key, required this.mapController});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  Completer<YandexMapController> mapController =
      Completer<YandexMapController>();
  final TextEditingController _textEditingController = TextEditingController();
  List<Shop> _suggestions = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    mapController = widget.mapController;
  }

  void _onTextChanged(String value) {
    setState(() {
      _isSearching = true;
    });
    setState(() {
      if (_textEditingController.text.isNotEmpty) {
        _suggestions = shops
            .where((shops) =>
                shops.name
                    .toLowerCase()
                    .contains(_textEditingController.text.toLowerCase()) ||
                shops.address
                    .toLowerCase()
                    .contains(_textEditingController.text.toLowerCase()))
            .toList();
        _suggestions = _suggestions.take(4).toList();
      } else {
        _suggestions.clear();
      }
      _isSearching = false;
    });
  }

  void _clearText() {
    setState(() {
      _textEditingController.clear();
      _suggestions.clear();
    });
  }

  Future<void> moveToShop(
      Point position, Completer<YandexMapController> mapController) async {
    (await mapController.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 17),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _textEditingController,
          onChanged: _onTextChanged,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.search_rounded,
              size: 30.0,
            ),
            hintText: "Поиск",
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: _textEditingController.text.isNotEmpty
                ? IconButton(
                    onPressed: _clearText, icon: const Icon(Icons.clear))
                : null,
          ),
        ),
        _isSearching
            ? const CircularProgressIndicator() // Индикатор загрузки во время поиска
            : _suggestions.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_suggestions[index].name),
                        subtitle: Text(_suggestions[index].address),
                        onTap: () {
                          moveToShop(_suggestions[index].point, mapController);
                        },
                      );
                    },
                  )
                : Container(),
      ],
    );
  }
}
