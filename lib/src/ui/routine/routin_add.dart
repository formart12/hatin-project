import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoutinAdd extends StatefulWidget {
  const RoutinAdd({super.key});

  @override
  State<RoutinAdd> createState() => _RoutinAddState();
}

class _RoutinAddState extends State<RoutinAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() => _routeAdd();

  Widget _routeAdd() {
    return Center(
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
                _routinAddBtn() // + 버튼
              ],
            ),
          ),
        ),
      ),
    );
  }

// 루틴 추가하기 옆에 + 버튼
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
