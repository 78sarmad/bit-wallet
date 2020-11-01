import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue.dart';
import 'package:bitcoin_wallet/widgets/custom_text_view.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:bitcoin_wallet/widgets/qr_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';

class ReceiveBitcoin extends StatelessWidget {
  String qrCode = "1F1tAaz5x1HUXrCNLbtMDqcw6o5GNn4xqX";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Receive Bitcoin",
          style: TextStyle(color: Colors.black, fontSize: Fonts.pageHeadText),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: AppColors.appBackground,
      child: ListView(
        children: [
          Container(
            child: Card(
              margin: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 15),
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CustomTextView(
                          text:
                              "Click the address to share it via email or text."),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: QRImageWidget(data: this.qrCode)),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(
                        child: CupertinoButton(
                          onPressed: () {
                            Share.share(
                                'Bitcoin Wallet Address: ' + this.qrCode,
                                subject: 'Share Wallet Address');
                          },
                          child: CustomTextView(
                            text: this.qrCode,
                            color: AppColors.lightBlue2,
                            fontSize: 14,
                          ),
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
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                children: [
                  CustomInputField(
                    label: "User Email",
                    placeHolder: "john.doe@gmail.com",
                    suffixIcon: Icon(Icons.person),
                  ),
                  CustomInputField(
                    label: "Amount",
                    placeHolder: "\$ 0.00",
                    suffixIcon: BitcoinBlue(
                      size: 24,
                      iconSize: 18,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Equals: ",
                          style: TextStyle(
                              color: AppColors.lightGrey2,
                              fontWeight: FontWeight.bold,
                              fontSize: Fonts.textFieldLabel),
                        ),
                        Text(
                          "0.00034 BTC",
                          style: TextStyle(
                              color: AppColors.lightGrey2,
                              fontSize: Fonts.textFieldLabel),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    child: GradientBtn(
                      label: "REQUEST",
                      ontap: () {
                        Toast.show("Request has been sent.", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                        Navigator.of(context).pop();
                      },
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
