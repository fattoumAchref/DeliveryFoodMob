import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText(
      {super.key,
      this.color,
      this.size = 12,
      required this.text,
      this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto', color: color, fontSize: size, height: height),
    );
  }
}
