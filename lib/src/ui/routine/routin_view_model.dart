import 'package:flutter/material.dart';
import 'package:hatin/src/model/routin.dart';
import 'package:hatin/src/service/routin_service.dart';

class RoutinViewModel extends ChangeNotifier {
  final RoutinService routinService;
  final List<Routin> _dailyRoutins = [];

  List<Routin> get routins => _dailyRoutins;

  RoutinViewModel({required this.routinService}) {
    _fetchData();
  }

  void _fetchData() async {
    final routins = await routinService.getAllRoutins();
    _dailyRoutins.clear();
    _dailyRoutins.addAll(routins);
    notifyListeners();
  }
}
