import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String label;

  Header({@required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        label,
        style: TextStyle(color: Colors.black, fontSize: Fonts.pageHeadText),
      ),
    );
  }
}
