import 'package:bitcoin_wallet/pages/payment.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NumericKeypad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: NumKey(number: "1")
                )
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: NumKey(number: "2")
                )
              ),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: NumKey(number: "3")
                )
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: NumKey(number: "4")
                  )
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: NumKey(number: "5")
                  )
                ),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: NumKey(number: "6")
                  )
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: NumKey(number: "7")
                  )
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: NumKey(number: "8")
                  )
                ),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: NumKey(number: "9")
                  )
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 15, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: NumKey(number: ".")
                  )
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: NumKey(number: "0")
                  )
                ),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: ArrowKey()
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumKey extends StatelessWidget {
  final String number;

  NumKey ({@required this.number});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: AppColors.white2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      padding: EdgeInsets.only(top: 16, bottom: 16),
      onPressed: (){},
      child: Text(number,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}


class ArrowKey extends StatelessWidget {

  ArrowKey();

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      color: AppColors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      onPressed: (){
        Navigations.goToScreen(context, Payment());
      },
      child: SvgPicture.asset("assets/images/arrow_right.svg",
        color: Colors.white,
        height: 32,
        width: 32,
      )
    );
  }
}