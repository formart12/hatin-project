import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        appBar: _appbar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: _bottom(),
        ));
  }

// 앱 바 부분
  PreferredSizeWidget _appbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Text(
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
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

// |내용부분| "이름 입력"
  Widget _bottom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _nameText(), // 이름 입력 텍스트
            _editName(), // 이름 입력 옆에 연필 모양 수정
          ],
        ),
        _routinTimeText(), // 루틴 시간
        _routinTimeAdd(), // 루틴 시간 아래
        _routinStartDayText(), // 루틴 시작일
        _routinStartDayTime(), // 루틴 시작일 아래
        _routinRepeatText(), // 루틴 반복
        _routinRepeatSelection(), // 루틴 반복 요일 선택

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _routinAlarmText(), // 알람
            _routinAlarmAction(), // 알람 On/Off
          ],
        ),
        _routinMemoText(),
        _routinMemoTyping(),
        _routinCreateButton(),
      ],
    );
  }

// |이름 입력| 텍스트
  Widget _nameText() {
    String routinName = "이름 입력";
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, top: 30.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 30.0),
        child: Text(
          routinName,
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
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
        child: const Icon(Icons.edit),
      ),
    );
  }

// |루틴 시간| 텍스트
  Widget _routinTimeText() {
    return const Padding(
      padding: EdgeInsets.only(left: 30.0, top: 30.0),
      child: Text(
        "루틴 시간",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

// |루틴 시간| 아래 오전 시간 박스
  Widget _routinTimeAdd() {
    TimeOfDay initialTime = const TimeOfDay(hour: 9, minute: 0);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: "${initialTime.hour}, ${initialTime.minute}"),
        onTap: () async {
          final TimeOfDay? timeOfDay = await showTimePicker(
            context: context,
            initialTime: initialTime,
          );
          if (timeOfDay != null) {
            setState(() {
              initialTime = timeOfDay;
            });
            print("$initialTime");
          }
        },
      ),
    );
  }

//|루틴 시작일| 텍스트
  Widget _routinStartDayText() {
    return const Padding(
      padding: EdgeInsets.only(left: 30.0, top: 15.0),
      child: Text(
        "루틴 시작일",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

//|루틴 시작일| 아래 시간
  Widget _routinStartDayTime() {
    DateTime initialDay = DateTime.now();
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText:
                "${initialDay.year}.${initialDay.month}.${initialDay.day}"),
        onTap: () async {
          final DateTime? dateTime = await showDatePicker(
              context: context,
              initialDate: initialDay,
              firstDate: DateTime(2000),
              lastDate: DateTime(3000));
          if (dateTime != null) {
            setState(() {
              initialDay = dateTime;
            });
          }
        },
      ),
    );
  }

// |루틴 반복| 텍스트
  Widget _routinRepeatText() {
    return const Padding(
      padding: EdgeInsets.only(left: 30.0, top: 15.0),
      child: Text(
        "루틴 반복",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  // |루틴 반복| 아래 반복할 날짜 선택
  Widget _routinRepeatSelection() {
    final List<String> DOW = ["월", "화", "수", "목", "금", "토", "일"];
    // DOW = Day Of Weak
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        DOW.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
          child: GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.0),
                color: Colors.white,
              ),
              child: Center(
                child: Text(DOW[index]),
              ),
            ),
            onTap: () {
              print("${DOW[index]}요일 누름");
            },
          ),
        ),
      ),
    );
  }

// |알람| 텍스트
  Widget _routinAlarmText() {
    return const Padding(
      padding: EdgeInsets.only(left: 30.0, top: 15.0),
      child: Text(
        "알림",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  // |알람| On/OFF
  Widget _routinAlarmAction() {
    bool switchValue = true;
    return Padding(
      padding: const EdgeInsets.only(left: 200.0, top: 15),
      child: Transform.scale(
        scale: 1.3,
        child: CupertinoSwitch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            }),
      ),
    );
  }

// |메모| 텍스트
  Widget _routinMemoText() {
    return const Padding(
      padding: EdgeInsets.only(left: 30.0, top: 25.0),
      child: Text(
        "메모",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

//|메모| 타이핑 공간
  Widget _routinMemoTyping() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Padding(
        //
        padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
        child: TextField(
          maxLines: null,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: "메모를 입력하세요"),
        ),
      ),
    );
  }

  Widget _routinCreateButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              print("클릭");
            },
            child: const Text(
              "루틴 생성",
            )),
      ),
    );
  }
}
