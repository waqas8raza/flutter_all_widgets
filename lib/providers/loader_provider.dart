import 'package:flutter/material.dart';

class LoaderProvider extends ChangeNotifier {
  bool isLoading = false;

  setLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
