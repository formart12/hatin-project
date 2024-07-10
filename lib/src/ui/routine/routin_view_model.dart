import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hatin/src/model/routin.dart';
import 'package:hatin/src/service/routin_service.dart';
import 'package:hatin/src/widget/hatin_dialog.dart';

class RoutinViewModel extends ChangeNotifier {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoutinService routinService;
  final List<Routin> _dailyRoutins = [];
  bool _isLoading = false;

  GlobalKey<ScaffoldState> get key => _scaffoldKey;

  bool _isEdit = false;

  List<Routin> get routins => _dailyRoutins;

  bool get isEdit => _isEdit;

  bool get isLoading => _isLoading;

  RoutinViewModel({required this.routinService}) {
    _fetchData();
  }

  void _fetchData() async {
    _isLoading = true;
    notifyListeners();
    final routins = await routinService.getAllRoutins();
    _dailyRoutins.clear();
    _dailyRoutins.addAll(routins);
    _isLoading = false;
    notifyListeners();
  }

  void edit() {
    if (_isEdit) {
      for (var routin in _dailyRoutins) {
        routin.check(false);
      }
    }
    _isEdit = !_isEdit;
    notifyListeners();
  }

  void allSelect() {
    for (var routin in _dailyRoutins) {
      routin.check(true);
    }
    notifyListeners();
  }

  void check(bool? value, int index) {
    _dailyRoutins[index].check(value!);
    notifyListeners();
  }

  void showDeleteDialog(BuildContext context) {
    final deleteRoutins =
        _dailyRoutins.where((routin) => routin.isCheck).toList();

    if (deleteRoutins.isEmpty) {
      return;
    }
    showDialog(
        context: context,
        builder: (context) => HatinDialog(
              content: const ["루틴의 모든 기록이", "영구적으로 삭제됩니다.", "", "정말 삭제하시겠습니까?"],
              commitLabel: "삭제",
              onCommit: () {},
              cancelLabel: "취소",
              onCancel: () {
                Navigator.of(context).pop();
              },
            ));
  }
}
