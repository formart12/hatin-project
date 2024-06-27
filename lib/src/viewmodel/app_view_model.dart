import 'package:flutter/material.dart';

class AppViewModel extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void changeIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}
