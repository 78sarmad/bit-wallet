import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final bool bold;

  CustomTextView({@required this.text, this.color = Colors.black, this.fontSize, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal
        ),
        maxLines: null,
      ),
    );
  }
}