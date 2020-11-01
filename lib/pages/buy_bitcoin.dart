import 'package:bitcoin_wallet/controllers/coinbase/get_price.dart';
import 'package:bitcoin_wallet/pages/confirmation.dart';
import 'package:bitcoin_wallet/pages/payment.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class BuyBitcoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Buy Bitcoin",
          style: TextStyle(color: Colors.black, fontSize: Fonts.pageHeadText),
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
                child: ListView(
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
                                    fontSize: Fonts.textFieldPlaceholder,
                                  ),
                                ),
                              ),
                              Container(
                                child: FutureBuilder(
                                    future: getBuyPrice(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          "\$ " + snapshot.data.amount,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                Fonts.textFieldPlaceholder,
                                          ),
                                        );
                                      } else {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                    }),
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: Fonts.textHeadings),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
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
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CupertinoButton(
                              child: Text("Manage"),
                              onPressed: () {
                                Navigations.goToScreen(context, Payment());
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
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
                    SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      child: GradientBtn(
                        label: "PROCEED TO PAY",
                        ontap: () {
                          Toast.show("Buy request has been posted.", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                          Navigator.of(context).pop();
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
