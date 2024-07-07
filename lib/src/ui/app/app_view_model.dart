import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppViewModel extends ChangeNotifier {
  final GlobalKey<NavigatorState> homeNavigationKey =
      GlobalKey<NavigatorState>();

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void changeIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}
