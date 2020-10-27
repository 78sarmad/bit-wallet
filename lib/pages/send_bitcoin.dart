import 'package:bitcoin_wallet/pages/add_contact.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:bitcoin_wallet/widgets/add_contact_card.dart';
import 'package:bitcoin_wallet/widgets/bitcoin_blue.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:bitcoin_wallet/widgets/notification_badge.dart';
import 'package:bitcoin_wallet/widgets/or_divider.dart';
import 'package:bitcoin_wallet/widgets/receipient_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendBitcoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Text(
          "Send Bitcoin",
          style: TextStyle(color: Colors.black),
        ),
        trailing: NotificationBadge(
          bellColor: Colors.black,
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
                    CupertinoTextField(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.lightGrey, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      prefix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.search,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      placeholder: "Search Contact",
                      placeholderStyle: TextStyle(color: AppColors.lightGrey),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("Select Recipient",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      height: 170,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigations.goToScreen(context, AddContact());
                            },
                            child: Container(
                              child: AddContactCard(),
                            ),
                          ),
                          Expanded(
                              child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Center(
                                  child:
                                      ReceipientCard(name: "James Williamson")),
                              Center(
                                child: ReceipientCard(
                                  name: "Mark Walberg",
                                  isSelected: true,
                                ),
                              ),
                              Center(child: ReceipientCard(name: "Peter Berg")),
                              Center(
                                  child:
                                      ReceipientCard(name: "Dwayne Johnson")),
                            ],
                          ))
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 20),
                        child: OrDivider()),
                    CustomInputField(
                      label: "Bitcoin address",
                      placeHolder: "Enter Bitcoin address",
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 3,
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  CustomInputField(
                      label: "Amount",
                      placeHolder: "\$0.00",
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
                          "0.00034BTC",
                          style: TextStyle(
                              color: AppColors.lightGrey2,
                              fontWeight: FontWeight.bold,
                              fontSize: Fonts.textFieldLabel),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 20),
                    child: GradientBtn(
                      label: "SEND",
                      ontap: () {},
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
