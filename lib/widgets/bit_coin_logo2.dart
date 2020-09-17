import 'package:bitcoin_wallet/widgets/rounded_square.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BitCoinLogo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -75,
          child: Transform.rotate(
            angle: 45,
            child: RoundedSquare()
          )
        ),
        Positioned(
          right: -70,
          top: -40,
          child: Transform.rotate(
            angle: 45,
            child: RoundedSquare()
          )
        ),
        Container(
          height: 60,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bit_coin.png"),
              fit: BoxFit.cover
            )
          ),
        )
      ],
    );
  }
}