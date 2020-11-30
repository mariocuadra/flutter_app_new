import 'package:flutter/material.dart';


class ButtonDropDown extends StatefulWidget {
  @override
  _ButtonDropDownState createState() => _ButtonDropDownState();
}


class _ButtonDropDownState extends State<ButtonDropDown> {

  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;

  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20.0,  bottom: 20.0),
      child :  DropdownButton(

          value: _selectedItem,
          items: _dropdownMenuItems,
          onChanged: (value) {
            setState(() {
              _selectedItem = value;
            });
          }),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}