import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final Alignment alignment;
  final FontWeight fontWeight;
  CustomText(
      {required this.text,
      this.color = Colors.black,
      required this.fontSize,
      this.alignment = Alignment.topLeft,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis),
      ),
      alignment: alignment,
    );
  }
}
