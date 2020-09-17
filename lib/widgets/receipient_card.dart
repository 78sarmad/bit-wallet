import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/material.dart';

class ReceipientCard extends StatelessWidget {
  final double containerSize = 110;
  final double imageSize = 40;
  final String name;
  final bool isSelected;

  ReceipientCard({@required this.name, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: isSelected ? AppColors.darkOrange : AppColors.lightGrey2)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(imageSize/2)
              // image: DecorationImage(
              //   image: null
              // )
            ),
          ),

          Container(
            child: Text(name,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}