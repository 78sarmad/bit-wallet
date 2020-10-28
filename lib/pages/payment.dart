import 'package:bitcoin_wallet/services/credit_card_service.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  User user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  TextEditingController cardNoController = new TextEditingController();
  TextEditingController cardNameController = new TextEditingController();
  TextEditingController cardExpiryController = new TextEditingController();
  TextEditingController cardCvcController = new TextEditingController();

  CreditCardService cds = new CreditCardService();

  Future<void> saveCreditCardInfo() async {
    String cardNo = cardNoController.text;
    String cardName = cardNameController.text;
    String cardExpiry = cardExpiryController.text;
    String cardCvc = cardCvcController.text;

    cds.createRecord(cardNo, cardName, cardExpiry, cardCvc);
  }

  String cardNo = "1234\t5678\t3456\t2456";
  String cardName = "John Doe";
  String cardExpiry = "5 / 23";
  String cardCvc = "123";

  void retrieveCreditCardInfo() {
    final databaseReference = FirebaseFirestore.instance;
    databaseReference.collection("cards").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) {
        setState(() {
          cardNo = f.data().values.elementAt(0);
          cardCvc = f.data().values.elementAt(1);
          cardName = f.data().values.elementAt(2);
          cardExpiry = f.data().values.elementAt(3);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    retrieveCreditCardInfo();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Payment",
          style: TextStyle(color: Colors.black),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: AppColors.appBackground,
      child: Container(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 15),
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 50,
                        color: AppColors.lightGrey2.withOpacity(0.2),
                        offset: Offset(0, 10))
                  ],
                  image: DecorationImage(
                      image: AssetImage("assets/images/payment_card_large.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
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
                            controller: cardNoController,
                            label: "Card Number",
                            placeHolder: cardNo,
                          ),
                          CustomInputField(
                            controller: cardNameController,
                            label: "Cardholder name",
                            placeHolder: cardName,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomInputField(
                                  controller: cardExpiryController,
                                  label: "Expiry Date",
                                  placeHolder: cardExpiry,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: CustomInputField(
                                  controller: cardCvcController,
                                  label: "CVC",
                                  placeHolder: cardCvc,
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
                                  child: Icon(
                                    Icons.check_box,
                                    color: AppColors.darkOrange,
                                  ),
                                ),
                                Container(
                                    child: RichText(
                                        text: TextSpan(children: [
                                  TextSpan(
                                      text: "I agree to the ",
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text: "Terms & Conditions",
                                      style: TextStyle(
                                        color: AppColors.lighBlue3,
                                        decoration: TextDecoration.underline,
                                      )),
                                ]))),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 20),
                        child: GradientBtn(
                          label: "UPDATE",
                          ontap: () {
                            if (cardNoController.text.isNotEmpty &&
                                cardNameController.text.isNotEmpty &&
                                cardExpiryController.text.isNotEmpty &&
                                cardCvcController.text.isNotEmpty) {
                              saveCreditCardInfo();
                              Toast.show("Credit Card Info updated.", context,
                                  duration: Toast.LENGTH_LONG,
                                  gravity: Toast.BOTTOM);
                              Navigator.of(context).pop();
                            } else {
                              Toast.show(
                                  "Please fill in all the fields.", context,
                                  duration: Toast.LENGTH_LONG,
                                  gravity: Toast.BOTTOM);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
