import 'package:bitcoin_wallet/pages/home.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:flutter/material.dart';

class GradientBtn extends StatelessWidget {
  final String label;
  final VoidCallback ontap;

  GradientBtn({@required this.label, @required this.ontap});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.darkOrange, AppColors.lightOrange])
      ),
      child: FlatButton(
        onPressed: ontap, 
        child: Text(label,
          style: TextStyle(
            color: Colors.white
          ),
        )
      ),
    );
  }
}