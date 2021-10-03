import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_flutter/Providers/category_provider.dart';
import 'package:online_shopping_flutter/Providers/item_provider.dart';
import 'package:online_shopping_flutter/components/category_item.dart';
import 'package:online_shopping_flutter/components/list_item.dart';
import 'package:online_shopping_flutter/model/item_detail.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoppango'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                style: TextStyle(fontSize: 25, color: Colors.white),
                padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                itemSize: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: Provider.of<CategoryProvider>(context)
                      .categories
                      .map((e) => CategoryItem(name: e))
                      .toList(),
                ),
              ),
              Consumer<ItemProvider>(builder: (context, itemProvider, child) {
                return Flexible(
                  flex: 9,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: itemProvider.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListItem(ItemDetail(
                          category: itemProvider.items[index].category,
                          name: itemProvider.items[index].name,
                          description: itemProvider.items[index].description,
                          price: itemProvider.items[index].price,
                          quantityInStock:
                              itemProvider.items[index].quantityInStock));
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), label: 'My Cart')
        ],
      ),
    );
  }
}
