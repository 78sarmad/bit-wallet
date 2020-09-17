import 'package:bitcoin_wallet/pages/confirmation.dart';
import 'package:bitcoin_wallet/pages/numeric_key_pad.dart';
import 'package:bitcoin_wallet/pages/payment.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:bitcoin_wallet/widgets/add_contact_card.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue_box.dart';
import 'package:bitcoin_wallet/widgets/circular_container.dart';
import 'package:bitcoin_wallet/widgets/custom_cupertino_icon.dart';
import 'package:bitcoin_wallet/widgets/custom_text_view.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:bitcoin_wallet/widgets/naira_orange_box.dart';
import 'package:bitcoin_wallet/widgets/notification_badge.dart';
import 'package:bitcoin_wallet/widgets/or_divider.dart';
import 'package:bitcoin_wallet/widgets/receipient_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Confirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text("Confirmation",
          style: TextStyle(color: Colors.black),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: AppColors.appBackground,
      child: Column(
        
        children: [

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15, top: 20),
                  child: Icon(Icons.lock,
                    size: 48,
                    color: AppColors.lightBlue,
                  ),
                ),

                CustomTextView(text: "Enter your Password to Confirm", bold: true,),

                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: CircularContainer(color: AppColors.green),
                      ),

                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: CircularContainer(color: AppColors.green),
                      ),

                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: CircularContainer(color: AppColors.lightGrey),
                      ),

                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: CircularContainer(color: AppColors.lightGrey),
                      )
                    ],
                  ),
                )
              ],
            )
            
          ),

          Expanded(
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: NumericKeypad()
              ),
            ),
          )
        ],
      ),
    );
  }

}