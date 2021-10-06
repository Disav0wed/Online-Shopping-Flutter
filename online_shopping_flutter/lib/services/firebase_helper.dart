import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shopping_flutter/Providers/category_provider.dart';
import 'package:online_shopping_flutter/Providers/product_list_provider.dart';
import 'package:online_shopping_flutter/model/product_detail.dart';

class FirebaseHelper {
  late FirebaseFirestore _fireStore;
  late ProductListProvider _productListProvider;
  late CategoryProvider _categoryProvider;
  bool _isInitialized = false;

  static var _firebaseHelper;

  FirebaseHelper._() {
    _fireStore = FirebaseFirestore.instance;
  }

  static FirebaseHelper getInstance() {
    _firebaseHelper ??= _firebaseHelper = FirebaseHelper._();

    return _firebaseHelper;
  }

  void init(CategoryProvider categoryProvider,
      ProductListProvider productListProvider) {
    this._categoryProvider = categoryProvider;
    this._productListProvider = productListProvider;
    _isInitialized = true;
  }

  void getCategories() async {
    if (_isInitialized) {
      List<String> list = await _fireStore
          .collection('categories')
          .get()
          .then((value) => value.docs
              .map(
                (e) => e.get('name').toString(),
              )
              .toList());
      _categoryProvider.categories = list;
    } else {
      throw InitException();
    }
  }

  void getCategoryItems(String category) async {
    if (_isInitialized) {
      List<ProductDetail> list =
          await _fireStore.collection(category).get().then((value) => value.docs
              .map(
                (e) => ProductDetail(
                  category: category,
                  name: e.get('name'),
                  description: e.get('description'),
                  price: e.get('price'),
                  quantityInStock: e.get('quantity'),
                  imageUrl: e.get('imageUrl'),
                ),
              )
              .toList());
      print('got the list of $category category with length: ' +
          list.length.toString());
      _productListProvider.items = list;
    } else {
      throw InitException();
    }
  }
}

class InitException implements Exception {
  String cause = "Call Init First";
}
