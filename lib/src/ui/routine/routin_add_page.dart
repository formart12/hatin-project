import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutinAddPage extends StatefulWidget {
  const RoutinAddPage({super.key});

  @override
  State<RoutinAddPage> createState() => _RoutinAddPageState();
}

class _RoutinAddPageState extends State<RoutinAddPage> {
  List<bool> _dowColor = List<bool>.filled(7, false);
  TimeOfDay initialTime = const TimeOfDay(hour: 09, minute: 00);
  // 요일 클릭 시 색 변화를 위한 List , false = 클릭전 , true = 클릭후
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
      backgroundColor: Colors.white,
    );
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
              style: TextStyle(fontSize: 16),
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
  Widget _body() {
    return SingleChildScrollView(
      child: Column(
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
          _routinRepeatText(), // 루틴 반복
          _routinRepeatSelection(), // 루틴 반복 요일 선택

          _routinAlarmText(), // 알람
          _routinAlarmAction(), // 알람 On/Off
          _routinMemoText(), // 메모
          _routinMemoTyping(), // 메모 타이핑 공간
          _routinCreateButton(), // 루틴 생성 버튼
        ],
      ),
    );
  }

// |이름 입력| 텍스트
  Widget _nameText() {
    String routinName = "이름 입력";
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 15.0),
      child: Text(
        routinName,
        style: const TextStyle(fontSize: 18.0, color: Color(0xff9B9B9B)),
      ),
    );
  }

// |이름 입력| 옆에 연필 모양 수정하기
  Widget _editName() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 15.0),
      child: GestureDetector(
        onTap: () {
          print("icons.edit이 눌려졌다!");
        },
        child: const Icon(
          Icons.edit,
          size: 31,
        ),
      ),
    );
  }

// |루틴 시간| 텍스트
  Widget _routinTimeText() {
    return const Padding(
      padding: EdgeInsets.only(left: 40.0, top: 40.0),
      child: Text(
        "시간 설정",
        style: TextStyle(fontSize: 16.0, color: Color(0xff111111)),
      ),
    );
  }

// |루틴 시간| 아래 오전 시간 박스
  Widget _routinTimeAdd() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Center(
        child: SizedBox(
          width: 335,
          height: 45,
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF1F3F5),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(68.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(68.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText:
                    "${initialTime.period.toString().split('.')[1]} ${initialTime.hour} ${initialTime.minute}",
                hintStyle: TextStyle(color: Color(0xff9B9B9B), fontSize: 18)),
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
        ),
      ),
    );
  }

// |루틴 반복| 텍스트
  Widget _routinRepeatText() {
    return const Padding(
      padding: EdgeInsets.only(left: 40.0, top: 30.0),
      child: Text(
        "루틴 반복",
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  // |루틴 반복| 아래 반복할 날짜 선택
  Widget _routinRepeatSelection() {
    final List<String> DOW = ["일", "월", "화", "수", "목", "금", "토"];
    // DOW = Day Of Weak
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        children: List.generate(
          DOW.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.2, vertical: 5),
            child: GestureDetector(
              child: Container(
                width: 32,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  color:
                      !_dowColor[index] ? Color(0xffFe4F28) : Color(0xffF1F3F5),
                  // 요일 클릭 되기전 : 클릭후 Container 색 변화
                ),
                child: Center(
                  child: Text(
                    DOW[index],
                    style: TextStyle(
                      color:
                          !_dowColor[index] ? Colors.white : Color(0xff9B9B9B),
                      // 요일 클릭 되기전 : 클릭후 글자색 변화
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  _dowColor[index] = !_dowColor[index];
                  print(DOW[index]);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

// |알람| 텍스트
  Widget _routinAlarmText() {
    return const Padding(
      padding: EdgeInsets.only(left: 40.0, top: 30.0),
      child: Text(
        "알림",
        style: TextStyle(fontSize: 16.0, color: Color(0xff111111)),
      ),
    );
  }

  // |알람| On/OFF
  Widget _routinAlarmAction() {
    bool switchValue = true;
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 5.0),
      child: Transform.scale(
        scale: 1.1,
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
      padding: EdgeInsets.only(left: 40.0, top: 25.0),
      child: Text(
        "메모",
        style: TextStyle(fontSize: 16.0, color: Color(0xff111111)),
      ),
    );
  }

//|메모| 타이핑 공간
  Widget _routinMemoTyping() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        //
        padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
        child: Center(
          child: SizedBox(
            width: 335,
            height: 57,
            child: TextField(
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF1F3F5),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: "메모 입력",
                hintStyle: TextStyle(color: Color(0xff9B9B9B9B), fontSize: 14),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
            ),
          ),
        ),
      ),
    );
  }

// 루틴 생성 버튼
  Widget _routinCreateButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFe4F28),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36)),
                fixedSize: Size(355, 56)),
            onPressed: () {
              Navigator.of(context).pop();
              //print("루틴 생성 버튼 클릭");
            },
            child: const Text(
              "루틴 생성",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
            )),
      ),
    );
  }
}
