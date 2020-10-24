import 'package:bitcoin_wallet/controllers/pin_code.dart';
import 'package:bitcoin_wallet/pages/numeric_key_pad.dart';
import 'package:bitcoin_wallet/pages/payment.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/widgets/circular_container.dart';
import 'package:bitcoin_wallet/widgets/custom_text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  int pressCount = 0;

  @override
  void initState() {
    super.initState();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Payment();
        },
      ),
    );
    // TODO: set timer on
    // Timer.periodic(Duration(milliseconds: 500), (timer) {
    //   setState(() {
    //     pressCount = getPressCount();
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Confirmation",
          style: TextStyle(color: Colors.black, fontSize: Fonts.pageHeadText),
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
                child: Icon(
                  Icons.lock,
                  size: 48,
                  color: AppColors.lightBlue,
                ),
              ),
              CustomTextView(
                text: (!isPinSet())
                    ? "Select a new PIN code"
                    : "Enter your PIN code to confirm",
                bold: true,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: CircularContainer(
                            color: (pressCount > 0)
                                ? AppColors.green
                                : AppColors.lightGrey)),
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: CircularContainer(
                          color: (pressCount > 1)
                              ? AppColors.green
                              : AppColors.lightGrey),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: CircularContainer(
                          color: (pressCount > 2)
                              ? AppColors.green
                              : AppColors.lightGrey),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: CircularContainer(
                          color: (pressCount > 3)
                              ? AppColors.green
                              : AppColors.lightGrey),
                    )
                  ],
                ),
              )
            ],
          )),
          Expanded(
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: NumericKeypad()),
            ),
          )
        ],
      ),
    );
  }
}
