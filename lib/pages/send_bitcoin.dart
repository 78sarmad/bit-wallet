import 'package:bitcoin_wallet/pages/add_contact.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:bitcoin_wallet/widgets/add_contact_card.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:bitcoin_wallet/widgets/or_divider.dart';
import 'package:bitcoin_wallet/widgets/recipient_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendBitcoin extends StatefulWidget {
  @override
  _SendBitcoinState createState() => _SendBitcoinState();
}

class _SendBitcoinState extends State<SendBitcoin> {
  TextEditingController addressController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();

  List contactNames = new List();
  List contactAddresses = new List();

  Future<void> retrieveContactsInfo() async {
    final databaseReference = FirebaseFirestore.instance;
    await databaseReference
        .collection("contacts")
        .orderBy("contact_name")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((f) {
        setState(() {
          contactNames.add(f.data().values.elementAt(0));
          contactAddresses.add(f.data().values.elementAt(1));
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    retrieveContactsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Send Bitcoin",
          style: TextStyle(color: Colors.black, fontSize: Fonts.pageHeadText),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: AppColors.appBackground,
      child: ListView(
        children: [
          Container(
            child: Card(
              margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Select Recipient",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Fonts.textFieldLabel)),
                    ),
                    Container(
                      height: 150,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigations.goToScreen(context, Notifications());
                            },
                            child: Container(
                              child: ContactCard(),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contactNames.length,
                              itemBuilder: (BuildContext context, int index) {
                                print(contactNames[index]);
                                return contactNames.isNotEmpty
                                    ? new Center(
                                        child: RecipientCard(
                                            name: contactNames[index],
                                            address: contactAddresses[index]))
                                    : new CircularProgressIndicator();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 20, right: 10, bottom: 40),
                        child: OrDivider()),
                    CustomInputField(
                      label: "Bitcoin Address",
                      placeHolder: "Enter Bitcoin Address",
                    ),
                    CustomInputField(
                        label: "Amount",
                        placeHolder: "\$ 0.00",
                        suffixIcon: BitcoinBlue(
                          size: 24,
                          iconSize: 18,
                        )),
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
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      child: GradientBtn(
                        label: "SEND",
                        ontap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
