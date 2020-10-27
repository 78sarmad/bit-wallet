import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoListTile extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color icon_color;

  CupertinoListTile(
      {@required this.message, @required this.icon, @required this.icon_color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(width: 2, color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: icon_color,
            size: 30,
          ),
          SizedBox(width: 20),
          Text(message,
              overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
