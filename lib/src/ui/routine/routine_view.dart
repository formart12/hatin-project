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
      child: Column(children: [
        _header(),
        _addRoutin(),
      ]),
    );
  }

  Widget _header() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("오늘 하루루틴"),
            TextButton(
              onPressed: () {},
              child: const Text(
                "전체 편집",
                style: TextStyle(color: Color(0xffa8a8a8)),
              ),
            )
          ],
        ),
      );

  Widget _addRoutin() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xffFF7658), Color(0xffFE4F28)]),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "루틴 추가하기",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/routinAddPage");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xffb9b9b9),
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
