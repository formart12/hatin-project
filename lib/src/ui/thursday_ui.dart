import 'package:flutter/material.dart';

class ThursDay extends StatefulWidget {
  const ThursDay({super.key});

  @override
  State<ThursDay> createState() => _ThursDayState();
}

class _ThursDayState extends State<ThursDay> {
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
    return const Text("오늘 하루루틴");
  }

  Widget _listedit() {
    return TextButton(
      onPressed: () {},
      child: const Text("전체 편집"),
    );
  }

  Widget _plusroutin() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.blue,
        )
      ],
    );
  }

  Widget _checkroutine() {
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
}
