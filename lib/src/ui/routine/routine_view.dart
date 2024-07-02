import 'package:flutter/material.dart';

class RoutineView extends StatefulWidget {
  const RoutineView({super.key});

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _todaylist(),
              _listedit(),
            ],
          ),
          _plusroutin(),
          _checkroutine(),
        ]),
      ),
    );
  }

  Widget _todaylist() {
    // 오늘 할 일
    return const Text("오늘 하루루틴");
  }

  Widget _listedit() {
    // 전체 편집 부분
    return TextButton(
      onPressed: () {},
      child: const Text("전체 편집"),
    );
  }

  Widget _plusroutin() {
    // 루틴이 보이고 옆에 아이콘을 누르면 루틴 추가 가능.
    return Column(
      children: [
        _body(),
      ],
    );
  }

  Widget _checkroutine() {
    // 빈 화면을 채울 위젯
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_circle,
          size: 60,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("루틴을 추가해주세요!"),
        )
      ],
    );
  }

  Widget _body() => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "루틴 추가하기",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  _routinAddBtn()
                ],
              ),
            ),
          ),
        ),
      );

  Widget _routinAddBtn() {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/routinAddPage");
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 170, 168, 168),
              shape: BoxShape.circle),
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
