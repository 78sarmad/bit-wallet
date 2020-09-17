import 'package:bitcoin_wallet/pages/confirmation.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
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
import 'package:flutter_svg/svg.dart';

class Payment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text("Payment",
          style: TextStyle(color: Colors.black),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: AppColors.appBackground,
      child: Column(
        
        children: [

          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/payment_card_large.png"),
                fit: BoxFit.cover
              )
            ),
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
                          label: "Card Number", 
                          placeHolder: "1234     5678     3456     2456", 
                        ),

                        CustomInputField(
                          label: "Cardholder name", 
                          placeHolder: "John Doe", 
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: CustomInputField(
                                label: "Expiry Date", 
                                placeHolder: " 5 / 23", 
                              ),
                            ),

                            SizedBox(
                              width: 5,
                            ),

                            Expanded(
                              child: CustomInputField(
                                label: "CVC", 
                                placeHolder: "123", 
                              ),
                            ),
                          ],
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5.0),
                                child: Icon(Icons.check_box,
                                  color: AppColors.darkOrange,
                                ),

                              ),

                              Container(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "I agree to The ",
                                        style: TextStyle(color: Colors.black)
                                      ),

                                      TextSpan(
                                        text: "Terms & Conditions",
                                        style: TextStyle(
                                          color: AppColors.lighBlue3,
                                          decoration: TextDecoration.underline,
                                          
                                        )
                                      ),
                                    ]
                                  )
                                )
                              ),
                              
                            ],
                          ),
                        )

                      ],
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      child: GradientBtn(
                        label: "PAY SECURE",
                        ontap: (){

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