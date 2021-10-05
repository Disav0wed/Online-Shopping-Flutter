import 'package:flutter/material.dart';
import 'package:online_shopping_flutter/Providers/product_detail_provider.dart';
import 'package:online_shopping_flutter/model/product_detail.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'productDetailScreen';
  late final ProductDetail _itemDetail;

  @override
  Widget build(BuildContext context) {
    this._itemDetail = Provider.of<ProductDetailProvider>(context).item;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 60,
                  color: Colors.white70,
                ),
              ),
            ),
            Center(
              child: Image.network(
                _itemDetail.imageUrl,
                alignment: Alignment.topCenter,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              _itemDetail.name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 45),
            ),
            Text(
              'Fiyat: ${_itemDetail.price} TL',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Detay: ${_itemDetail.description}',
              style: TextStyle(fontSize: 30),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: MaterialButton(
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Satin Al',
                      style: TextStyle(
                        fontSize: 45,
                      ),
                    ),
                    onPressed: () {
                      print('Satin Al');
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
