import 'package:flutter/foundation.dart';
import 'package:online_shopping_flutter/model/item_detail.dart';

class ItemProvider extends ChangeNotifier {
  List<ItemDetail> _items = new List.empty(growable: true);

  ItemProvider() {
    _items.add(ItemDetail(
        category: 'MTB',
        name: 'Bisan D900',
        description: 'Guzel Bisiklet',
        price: '2100 TRY',
        quantityInStock: 'quantityInStock'));

    _items.add(ItemDetail(
        category: 'MTB',
        name: 'Bertone D900',
        description: 'Iyi Bisiklet',
        price: '1600 TRY',
        quantityInStock: 'quantityInStock'));

    _items.add(ItemDetail(
        category: 'MTB',
        name: 'Bianchi D900',
        description: 'Harika Bisiklet',
        price: '3100 TRY',
        quantityInStock: 'quantityInStock'));
    notifyListeners();
  }

  List<ItemDetail> get items => _items;

  set items(List<ItemDetail> value) {
    _items = value;
    notifyListeners();
  }
}
