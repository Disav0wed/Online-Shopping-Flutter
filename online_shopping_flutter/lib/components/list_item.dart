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
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 15,
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              itemDetail.imageUrl,
              alignment: Alignment.topCenter,
              fit: BoxFit.scaleDown,
            ),
            Text(
              itemDetail.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.longestSide / 40,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Fiyat: ${itemDetail.price} TL',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.longestSide / 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
