import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const CustomOutlinedButton({super.key, this.onPressed, required this.label})
      : assert(onPressed != null, "액션함수를 지정해주세요 onPressed is Null");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      highlightColor: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(36.0),
      child: Ink(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36.0),
            border: Border.all(width: 1.0, color: const Color(0xff111111))),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xff111111),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
