import 'package:flutter/material.dart';

Widget customSearchBar({
  Color searchFillColor = Colors.grey,
  required Function onchanged,
  required Function() suffiixonPressed,
  required Widget theSuffixIcon,
  required TextEditingController theTextController,
}) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6), color: searchFillColor),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: theTextController,
              onChanged: (value) => onchanged(value),
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                hintText: 'Search Countries',
              ),
            ),
          ),
          IconButton(onPressed: suffiixonPressed, icon: theSuffixIcon)
        ],
      ),
    ),
  );
}
