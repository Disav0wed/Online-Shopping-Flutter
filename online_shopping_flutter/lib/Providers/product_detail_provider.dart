import 'package:flutter/foundation.dart';
import 'package:online_shopping_flutter/model/product_detail.dart';

class ProductDetailProvider extends ChangeNotifier {
  late ProductDetail _item;

  ProductDetail get item => _item;

  set item(ProductDetail itemDetail) {
    _item = itemDetail;
    notifyListeners();
  }
}
