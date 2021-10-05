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
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_itemDetail.name),
          Text(_itemDetail.price),
          Text(_itemDetail.description),
        ],
      ),
    );
  }
}
