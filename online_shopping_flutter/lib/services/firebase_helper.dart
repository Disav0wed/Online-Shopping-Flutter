import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shopping_flutter/Providers/category_provider.dart';
import 'package:online_shopping_flutter/Providers/product_list_provider.dart';
import 'package:online_shopping_flutter/model/product_detail.dart';

class FirebaseHelper {
  late FirebaseFirestore _fireStore;

  ProductListProvider _productListProvider;
  CategoryProvider _categoryProvider;

  FirebaseHelper(this._categoryProvider, this._productListProvider) {
    _fireStore = FirebaseFirestore.instance;
  }

  void getCategories() async {}

  Future<List<ProductDetail>> getCategoryItems(String category) async {
    List<ProductDetail> list =
        await _fireStore.collection(category).get().then((value) => value.docs
            .map(
              (e) => ProductDetail(
                  category: category,
                  name: e.get('name'),
                  description: e.get('description'),
                  price: 'price',
                  quantityInStock: e.get('quantity')),
            )
            .toList());
    _productListProvider.items = list;
    return list;
  }
}
