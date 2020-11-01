import 'package:bitcoin_wallet/pages/home.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:flutter/material.dart';

class GradientBtn extends StatelessWidget {
  final String label;
  final VoidCallback ontap;
  final Color color;

  GradientBtn({@required this.label, @required this.ontap, this.color});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color ?? AppColors.darkOrange,
          color ?? AppColors.lightOrange
        ]),
      ),
      child: FlatButton(
          onPressed: ontap,
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
