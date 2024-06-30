import 'package:flutter/material.dart';

class RoutinWidget extends StatelessWidget {
  const RoutinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _routinTitle(),
              _routinDuration(),
            ],
          ),
          _isComplete(),
        ],
      ),
    );
  }

  Widget _routinTitle() => const Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(
          "루틴 이름",
          style: TextStyle(),
        ),
      );

  Widget _routinDuration() => const Padding(
        padding: EdgeInsets.all(4.0),
        child: Text("00:00 ~ 00:00"),
      );

  Widget _isComplete() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          child: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      );
}
