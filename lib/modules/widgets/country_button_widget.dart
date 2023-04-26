import 'package:flutter/material.dart';

class SearchableDropdown extends StatefulWidget {
  final List<String> items;

  SearchableDropdown({required this.items});

  @override
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  String? selectedItem;

  List<String> get filteredItems {
    List<String> filteredList = [];
    for (String item in widget.items) {
      if (item.toLowerCase().contains(searchText.toLowerCase())) {
        filteredList.add(item);
      }
    }
    return filteredList;
  }

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
          decoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        DropdownButton<String>(
          isExpanded: true,
          value: selectedItem,
          items: filteredItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              selectedItem = value;
            });
          },
        ),
      ],
    );
  }
}
