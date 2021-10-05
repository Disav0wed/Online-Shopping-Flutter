import 'package:flutter/foundation.dart';
import 'package:online_shopping_flutter/model/product_detail.dart';

class ProductListProvider extends ChangeNotifier {
  List<ProductDetail> _items = new List.empty(growable: true);

  List<ProductDetail> get items => _items;

  set items(List<ProductDetail> value) {
    _items = value;
    notifyListeners();
  }
}
