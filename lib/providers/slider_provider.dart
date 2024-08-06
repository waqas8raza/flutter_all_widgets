import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double sliderValue = 0;
  setSlider(double value) {
    sliderValue = value;
    notifyListeners();
  }
}
