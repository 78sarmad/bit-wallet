import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BitcoinBlue extends StatelessWidget {
  final double size;
  final double iconSize;

  BitcoinBlue({this.size=30, this.iconSize =20});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(size/2),
        border: Border.all(color: Colors.white)
      ) ,
      child: Center(
        child: SvgPicture.asset("assets/images/bit_white.svg",
          height: iconSize,
          width: iconSize,
        ),
      ),
    );
  }
}