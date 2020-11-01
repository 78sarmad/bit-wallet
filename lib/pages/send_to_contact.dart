import 'package:bitcoin_wallet/pages/home.dart';
import 'package:bitcoin_wallet/services/contact_service.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/utils/header.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:bitcoin_wallet/widgets/or_divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SendBitcoinToContact extends StatefulWidget {
  @override
  _SendBitcoinToContactState createState() => _SendBitcoinToContactState();

  final String contactName;
  final String contactAddress;

  SendBitcoinToContact(
      {@required this.contactName, @required this.contactAddress});
}

class _SendBitcoinToContactState extends State<SendBitcoinToContact> {
  TextEditingController amountController = new TextEditingController();

  ContactService cs = new ContactService();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Header(label: "Send Bitcoin"),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 50, right: 16),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.white,
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/user.png'),
                            )),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(widget.contactName ?? "null",
                          style: TextStyle(fontSize: 24))),
                  SizedBox(height: 30),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Card(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20, bottom: 20),
                              child: Column(
                                children: [
                                  CustomInputField(
                                    label: "Amount",
                                    placeHolder: "\$ 0.00",
                                    controller: amountController,
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
                                    margin: const EdgeInsets.only(top: 50),
                                    child: GradientBtn(
                                      label: "SEND",
                                      ontap: () {
                                        final amount =
                                            amountController.text.toString();

                                        if (amount.isNotEmpty) {
                                          // TODO: Coinbase API transfer method
                                          Toast.show(
                                              "Transfer request has been posted.",
                                              context,
                                              duration: Toast.LENGTH_SHORT,
                                              gravity: Toast.BOTTOM);
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        } else {
                                          Toast.show(
                                              "Please fill in the amount.",
                                              context,
                                              duration: Toast.LENGTH_SHORT,
                                              gravity: Toast.BOTTOM);
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Divider(),
                                  SizedBox(height: 10),
                                  Container(
                                    child: GradientBtn(
                                      color: Colors.red,
                                      label: "DELETE CONTACT",
                                      ontap: () {
                                        cs.deleteRecord(widget.contactName);
                                        Toast.show("Contact has been deleted.",
                                            context,
                                            duration: Toast.LENGTH_SHORT,
                                            gravity: Toast.BOTTOM);
                                        Navigator.of(context).pop();
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText,
      String placeholderText,
      bool isPasswordTextField,
      TextEditingController textController,
      IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(labelText),
          ),
          SizedBox(height: 10),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(width: 2, color: AppColors.lightGrey),
            ),
            child: CupertinoTextField(
              style: TextStyle(color: Colors.black),
              controller: textController,
              placeholder: placeholderText,
              decoration: BoxDecoration(color: Colors.white),
              placeholderStyle: TextStyle(
                color: AppColors.lightGrey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              suffix: Icon(
                icon,
                color: Colors.grey,
                size: 30,
              ),
              obscureText: isPasswordTextField ? true : false,
            ),
          ),
        ],
      ),
    );
  }

  // showAlertDialog(BuildContext context) {
  //   // set up the buttons
  //   Widget cancelButton = CupertinoButton(
  //     child: Text("Cancel"),
  //     onPressed: () {
  //       Navigator.of(context).pop();
  //     },
  //   );
  //   Widget continueButton = CupertinoButton.filled(
  //     child: Text("Delete"),
  //     disabledColor: Colors.red,
  //     onPressed: () {
  //       cs.deleteRecord(widget.contactName);
  //       Toast.show("Contact has been deleted.", context,
  //           duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  //       Navigator.of(context).pop();
  //       Navigator.of(context).pop();
  //     },
  //   );
  //   // set up the AlertDialog
  //   CupertinoAlertDialog alert = CupertinoAlertDialog(
  //     title: Text("Delete Confirmation"),
  //     content: Text("Are you sure you want to delete this contact?"),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}
