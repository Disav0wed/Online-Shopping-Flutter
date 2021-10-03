import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final bool isSelected;

  CategoryItem({required this.name, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: isSelected ? Colors.grey.shade500 : Colors.grey.shade800,
        disabledColor: Colors.grey.shade800,
        elevation: isSelected ? 20 : 10,
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
