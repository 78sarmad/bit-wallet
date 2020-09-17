import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final double size;
  final Color color;

  CircularContainer({@required this.color, this.size=20});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size/2)
      ),
    );
  }
}