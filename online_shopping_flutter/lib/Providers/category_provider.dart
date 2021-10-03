import 'package:flutter/foundation.dart';

class CategoryProvider extends ChangeNotifier {
  List<String> _categories = new List.empty(growable: true);

  List<String> get categories => _categories;

  CategoryProvider() {
    _categories.add('YENILER');
    _categories.add('MTB');
    _categories.add('YOL');
    _categories.add('YARIS');
    _categories.add('PARCALAR');

    notifyListeners();
  }

  set categories(List<String> value) {
    _categories = value;
    notifyListeners();
  }
}
