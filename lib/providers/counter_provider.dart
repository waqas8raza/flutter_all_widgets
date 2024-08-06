import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;
  void increment(int nymber) {
    count = count + nymber;
    notifyListeners();
  }

  void decrement() {
    if (count > 0) {
      count--;
    }
    notifyListeners();
  }
}
