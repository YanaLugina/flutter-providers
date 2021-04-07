import 'package:flutter/material.dart';

class MyCountProvider extends ChangeNotifier {
  int _count = 0;
  int get counterValue => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }

  void decrementCount() {
    _count--;
    notifyListeners();
  }
}
