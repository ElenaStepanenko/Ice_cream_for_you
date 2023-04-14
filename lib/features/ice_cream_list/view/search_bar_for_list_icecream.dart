import 'package:flutter/material.dart';
import 'package:project/repositories/ice_cream/models/ice_cream_repository.dart';

class SearchBarIceCreams extends StatefulWidget {
  final List<IceCream> iceCreams;
  final Function(List<IceCream>) onShopsListChanged;
  const SearchBarIceCreams(
      {super.key, required this.iceCreams, required this.onShopsListChanged});

  @override
  State<SearchBarIceCreams> createState() => _SearchBarIceCreamstate();
}

class _SearchBarIceCreamstate extends State<SearchBarIceCreams> {
  List<IceCream> filterIceCreams = [];
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    filterIceCreams = widget.iceCreams;
  }

  void _onTextChanged(String value) {
    setState(() {
      if (_textEditingController.text.isNotEmpty) {
        filterIceCreams = widget.iceCreams
            .where((iceCream) =>
                iceCream.name
                    .toLowerCase()
                    .contains(_textEditingController.text.toLowerCase()) ||
                iceCream.price
                    .toLowerCase()
                    .contains(_textEditingController.text.toLowerCase()))
            .toList();
      } else {
        filterIceCreams = iceCreams;
      }
    });
    widget.onShopsListChanged(filterIceCreams);
  }

  void _clearText() {
    setState(() {
      _textEditingController.clear();
      filterIceCreams = iceCreams;
      widget.onShopsListChanged(filterIceCreams);
      _focusNode.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
              ? IconButton(onPressed: _clearText, icon: const Icon(Icons.clear))
              : null,
        ),
      ),
    ]);
  }
}
