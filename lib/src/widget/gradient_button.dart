import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const GradientButton({super.key, this.onPressed, required this.label})
      : assert(onPressed != null, "액션 함수를 반드시 지정해야 합니다 onPressed is Null");

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
            borderRadius: BorderRadius.circular(36.0),
            gradient: const LinearGradient(
                colors: [Color(0xffff3d3d), Color(0xffff7354)])),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
