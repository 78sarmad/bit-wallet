import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/widgets/add_contact_card.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue_box.dart';
import 'package:bitcoin_wallet/widgets/custom_cupertino_icon.dart';
import 'package:bitcoin_wallet/widgets/custom_text_view.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:bitcoin_wallet/widgets/naira_orange_box.dart';
import 'package:bitcoin_wallet/widgets/notification_badge.dart';
import 'package:bitcoin_wallet/widgets/or_divider.dart';
import 'package:bitcoin_wallet/widgets/receipient_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawToBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text("Withdraw to Bank",
          style: TextStyle(color: Colors.black),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: AppColors.appBackground,
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 20, left: 15, right: 15),
            child: NairaOrangeBox()
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
                        CustomInputField(
                          label: "Nigerian Naira", 
                          placeHolder: "₦ 0.00", 
                          suffixIcon: BitcoinBlue(size: 24, iconSize: 18,)
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Text("\$ 15,00",
                            style: TextStyle(
                              color: Colors.black, 
                              fontWeight: FontWeight.bold, 
                              fontSize: 18
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text("American Currency",
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
                      child: GradientBtn(label: "WITHDRAW", ontap: (){},),
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