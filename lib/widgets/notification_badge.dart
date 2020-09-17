import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final Color bellColor;

  NotificationBadge({this.bellColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          child: Icon(CupertinoIcons.bell,
            color: bellColor,
          ),
        ),
        Positioned(
          right: 4,
          top: 3,
          child: Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(3)
            ),
          )
        )
      ],
    );
  }
}