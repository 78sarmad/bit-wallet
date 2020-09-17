import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddContactCard extends StatelessWidget {
  final double containerSize = 110;
  final double imageSize = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black)
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
            child: Icon(CupertinoIcons.add,
              color: Colors.white,
            ),
          ),

          Container(
            child: Text("Add Contact",
              style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}