import 'package:flutter/material.dart';
import 'package:online_shopping_flutter/Providers/product_detail_provider.dart';
import 'package:online_shopping_flutter/model/product_detail.dart';
import 'package:online_shopping_flutter/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final ProductDetail itemDetail;

  ListItem(this.itemDetail);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<ProductDetailProvider>(context, listen: false).item =
            this.itemDetail;
        Navigator.pushNamed(context, ProductDetailScreen.ROUTE_NAME);
      },
      child: Card(
        margin: EdgeInsets.all(15),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 15,
        color: Colors.white70,
        child: Column(
          children: [
            Image.network(
              'https://mcdn01.gittigidiyor.net/67813/tn50/678134228_tn50_0.jpg',
              alignment: Alignment.topCenter,
            ),
            Text(
              itemDetail.name,
            ),
            Text(
              itemDetail.description,
            ),
            Text(
              itemDetail.price,
            )
          ],
        ),
      ),
    );
  }
}
