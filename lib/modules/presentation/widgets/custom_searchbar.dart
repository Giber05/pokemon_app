import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final VoidCallback? onReset;

  const CustomSearchBar({
    required this.controller,
    required this.onSubmitted,
    this.onReset,
  });

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool _showResetButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    setState(() {
      _showResetButton = widget.controller.text.isNotEmpty;
    });
  }

  void _onResetPressed() {
    setState(() {
      widget.controller.clear();
      _showResetButton = false;
      widget.onReset?.call();
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onSearchTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              onChanged: (value) {
                _onSearchTextChanged();
                if (value.isEmpty) {
                  _onResetPressed();
                }
              },
              onFieldSubmitted: widget.onSubmitted,
              decoration: const InputDecoration(
                hintText: 'Search Pokémon',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          if (_showResetButton)
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: _onResetPressed,
            ),
        ],
      ),
    );
  }
}
