import 'package:flutter/material.dart';
import 'package:online_shopping_flutter/Providers/category_provider.dart';
import 'package:online_shopping_flutter/Providers/product_list_provider.dart';
import 'package:online_shopping_flutter/services/firebase_helper.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final bool isSelected;
  final int index;

  CategoryItem({
    required this.name,
    required this.index,
    this.isSelected = false,
  });

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
        onPressed: () {
          Provider.of<CategoryProvider>(context, listen: false)
              .selectedCategoryIndex = index;
          FirebaseHelper.getInstance().getCategoryItems(name);
        },
        child: Text(
          name.toUpperCase(),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
