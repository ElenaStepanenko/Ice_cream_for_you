import 'dart:async';
import 'package:flutter/material.dart';
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
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    mapController = widget.mapController;
  }

  void _onTextChanged(String value) {
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
    });
  }

  void _clearText() {
    setState(() {
      _textEditingController.clear();
      _suggestions.clear();
      _focusNode.unfocus();
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
          focusNode: _focusNode,
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
        _suggestions.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_suggestions[index].name),
                    subtitle: Text(_suggestions[index].address),
                    onTap: () {
                      moveToShop(_suggestions[index].point, mapController);
                      _clearText();
                    },
                  );
                },
              )
            : Container(),
      ],
    );
  }
}
