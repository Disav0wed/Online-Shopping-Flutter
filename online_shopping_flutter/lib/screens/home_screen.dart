import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_flutter/Providers/category_provider.dart';
import 'package:online_shopping_flutter/Providers/product_list_provider.dart';
import 'package:online_shopping_flutter/components/category_item.dart';
import 'package:online_shopping_flutter/components/list_item.dart';
import 'package:online_shopping_flutter/model/product_detail.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'homeScreen';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoSearchTextField(
                style: TextStyle(fontSize: 25, color: Colors.white),
                padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                itemSize: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 70, minHeight: 40),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: Provider.of<CategoryProvider>(context)
                      .categories
                      .map((e) => CategoryItem(name: e))
                      .toList(),
                ),
              ),
              Consumer<ProductListProvider>(
                  builder: (context, itemProvider, child) {
                return Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 1000,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: itemProvider.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListItem(
                          ProductDetail(
                            category: itemProvider.items[index].category,
                            name: itemProvider.items[index].name,
                            description: itemProvider.items[index].description,
                            price: itemProvider.items[index].price,
                            quantityInStock:
                                itemProvider.items[index].quantityInStock,
                            imageUrl: itemProvider.items[index].imageUrl,
                          ),
                        );
                      },
                    ),
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
