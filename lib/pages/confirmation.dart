import 'package:bitcoin_wallet/controllers/pin_code.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/widgets/circular_container.dart';
import 'package:bitcoin_wallet/widgets/custom_text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toast/toast.dart';

int pressCount = 0;
PinCode PC = new PinCode();

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  void initState() {
    super.initState();
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
                text: (PC.isPinSet() != true)
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
                  child: numericKeypad(context)),
            ),
          )
        ],
      ),
    );
  }

  Widget numericKeypad(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: NumKey(number: "1"))),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: NumKey(number: "2"))),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: NumKey(number: "3"))),
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
                        child: NumKey(number: "4"))),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: NumKey(number: "5"))),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: NumKey(number: "6"))),
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
                        child: NumKey(number: "7"))),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: NumKey(number: "8"))),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: NumKey(number: "9"))),
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
                        child: NumKey(number: "."))),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: NumKey(number: "0"))),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: ArrowKey())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumKey extends StatefulWidget {
  final String number;

  NumKey({@required this.number});

  @override
  _NumKeyState createState() => _NumKeyState();
}

class _NumKeyState extends State<NumKey> {
  void incrementPressCount() {
    setState(() {
      pressCount = pressCount + 1;
    });
  }

  void resetPressCount() {
    setState(() {
      pressCount = 0;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: AppColors.white2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      padding: EdgeInsets.only(top: 16, bottom: 16),
      onPressed: () {
        incrementPressCount();
        PC.grabPinDigits(widget.number);
      },
      child: Text(
        widget.number,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class ArrowKey extends StatefulWidget {
  @override
  _ArrowKeyState createState() => _ArrowKeyState();
}

class _ArrowKeyState extends State<ArrowKey> {
  void resetPressCount() {
    setState(() {
      pressCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: AppColors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        onPressed: () {
          PC.checkPinSet();
          if (PC.checkSet != true) {
            PC.savePinCode();
            Toast.show("PIN saved.", context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          } else {
            PC.checkPinMatch();
            if (PC.checkMatch == true) {
              Toast.show("PIN matched.", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            } else {
              Toast.show("Incorrect PIN. Please try again.", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            }
          }

          resetPressCount();
          Future.delayed(Duration(seconds: 3), () {
            PC.resetAll();
          });
        },
        child: SvgPicture.asset(
          "assets/images/arrow_right.svg",
          color: Colors.white,
          height: 32,
          width: 32,
        ));
  }
}
