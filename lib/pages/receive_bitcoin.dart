import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue.dart';
import 'package:bitcoin_wallet/widgets/custom_text_view.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:bitcoin_wallet/widgets/notification_badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReceiveBitcoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Receive Bitcoin",
          style: TextStyle(color: Colors.black),
        ),
        trailing: NotificationBadge(
          bellColor: Colors.black,
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: AppColors.appBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Card(
              margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: CustomTextView(
                          text:
                              "Copy the address and send to the sender via email or text."),
                    ),
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/bar_code.png"),
                              fit: BoxFit.contain)),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: CustomTextView(
                          text: "1F1tAaz5x1HUXrCNLbtMDqcw6o5GNn4xqX",
                          color: AppColors.lightBlue2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 3,
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  CustomInputField(
                      label: "Amount",
                      placeHolder: "\$0.00",
                      suffixIcon: BitcoinBlue(
                        size: 24,
                        iconSize: 18,
                      )),
                  Container(
                    child: Text(
                      "0.00034BTC",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 20),
                    child: GradientBtn(
                      label: "REQUEST",
                      ontap: () {},
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
