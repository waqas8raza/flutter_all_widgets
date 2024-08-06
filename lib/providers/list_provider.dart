import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<String> names = ['waqas', 'zaffar'];

  void addItem(String name) {
    names.add(name);
    notifyListeners();
  }
}
