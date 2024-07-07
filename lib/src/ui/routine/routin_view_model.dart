import 'package:flutter/material.dart';
import 'package:hatin/src/model/routin.dart';
import 'package:hatin/src/service/routin_service.dart';

class RoutinViewModel extends ChangeNotifier {
  final RoutinService routinService;
  final List<Routin> _dailyRoutins = [];

  bool _isEdit = false;

  List<Routin> get routins => _dailyRoutins;

  bool get isEdit => _isEdit;

  RoutinViewModel({required this.routinService}) {
    _fetchData();
  }

  void _fetchData() async {
    final routins = await routinService.getAllRoutins();
    _dailyRoutins.clear();
    _dailyRoutins.addAll(routins);
    notifyListeners();
  }

  void edit() {
    _isEdit = !_isEdit;
    notifyListeners();
  }
}
