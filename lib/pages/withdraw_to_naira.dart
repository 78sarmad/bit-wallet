import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue_box.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawToNaira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Withdraw to Naira",
          style: TextStyle(color: Colors.black, fontSize: Fonts.pageHeadText),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: AppColors.appBackground,
      child: ListView(
        children: [
          Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 20, left: 15, right: 15),
              child: BitcoinBlueBox()),
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
                        CustomInputField(
                            label: "Bitcoin",
                            placeHolder: "0.00 BTC",
                            suffixIcon: BitcoinBlue(
                              size: 24,
                              iconSize: 18,
                            )),
                        SizedBox(height: 50),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Text(
                            "₦ 15,000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Nigerian Currency",
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      child: GradientBtn(label: "WITHDRAW", ontap: () {}),
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
