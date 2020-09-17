import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoIcon extends StatelessWidget {
  final int iconCode;
  final Color color;
  final double size;

  CustomCupertinoIcon({@required this.iconCode, @required this.color, this.size});

  @override
  Widget build(BuildContext context) {

    IconData iconData = IconData(iconCode,
          fontFamily: CupertinoIcons.iconFont,
          fontPackage: CupertinoIcons.iconFontPackage);
    return Icon(iconData, color: color, size: size);
  }
}