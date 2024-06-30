import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoutinAddPage extends StatefulWidget {
  const RoutinAddPage({super.key});

  @override
  State<RoutinAddPage> createState() => _RoutinAddPageState();
}

class _RoutinAddPageState extends State<RoutinAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbar(), backgroundColor: Colors.white, body: _bottom());
  }

  PreferredSizeWidget _appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              "루틴 추가하기",
              style: TextStyle(fontSize: 20),
            ),
            actions: [_appBarCloseBtn()],
          ),
        ],
      ),
    );
  }

// |앱 바| X 닫기 버튼
  Widget _appBarCloseBtn() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

// |내용부분| "이름 입력"
  Widget _bottom() {
    String _routinName = "이름 입력";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 30.0),
              child: Text(
                _routinName,
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            _editName()
          ],
        ),
        _routinTime(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(),
        ),
      ],
    );
  }

// |이름 입력| 옆에 연필 모양 수정하기
  Widget _editName() {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, top: 30.0),
      child: GestureDetector(
        onTap: () {
          print("icons.edit이 눌려졌다!");
        },
        child: Icon(Icons.edit),
      ),
    );
  }

// |루틴 시간|
  Widget _routinTime() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 30.0),
      child: Text(
        "루틴 시간",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
