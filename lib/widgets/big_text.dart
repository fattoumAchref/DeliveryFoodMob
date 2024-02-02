import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {super.key,
      this.color,
      this.size = 30,
      required this.text,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size),
    );
  }
}
