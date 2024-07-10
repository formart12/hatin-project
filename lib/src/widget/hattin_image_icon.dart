import 'package:flutter/material.dart';

class HattinImageIcon extends StatelessWidget {
  final String path;
  const HattinImageIcon({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}

class ImagePath {
  static String get logo => "asset/image/hattin_logo.png";
}
