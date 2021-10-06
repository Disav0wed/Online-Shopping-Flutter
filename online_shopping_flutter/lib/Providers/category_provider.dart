import 'package:flutter/foundation.dart';

class CategoryProvider extends ChangeNotifier {
  List<String> _categories = new List.empty(growable: true);
  int _selectedCategoryIndex = 0;

  int get selectedCategoryIndex => _selectedCategoryIndex;

  set selectedCategoryIndex(int value) {
    _selectedCategoryIndex = value;
    notifyListeners();
  }

  List<String> get categories => _categories;

  set categories(List<String> value) {
    _categories = value;
    notifyListeners();
  }
}
