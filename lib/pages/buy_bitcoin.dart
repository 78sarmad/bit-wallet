import 'package:bitcoin_wallet/pages/confirmation.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyBitcoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Buy Bitcoin",
          style: TextStyle(color: Colors.black),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: AppColors.appBackground,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Current Price / BTC",
                                  style: TextStyle(
                                    color: AppColors.lightGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "11,470.40",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        CustomInputField(
                            label: "Enter amount",
                            placeHolder: "₦ 0.00",
                            suffixIcon: BitcoinBlue(
                              size: 24,
                              iconSize: 18,
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/payment_card_small.png"),
                                      fit: BoxFit.contain)),
                            ),
                            Container(
                              child: Text(
                                "Credit / Debit card",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 30, bottom: 0),
                            child: Text(
                              "You will receive",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Text(
                            "0.00034",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            "BTC",
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      child: GradientBtn(
                        label: "PROCEED TO PAY",
                        ontap: () {
                          Navigations.goToScreen(context, Confirmation());
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
