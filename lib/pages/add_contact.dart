import 'package:bitcoin_wallet/services/contact_service.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/utils/header.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  TextEditingController contactNameController = new TextEditingController();
  TextEditingController contactAddressController = new TextEditingController();

  ContactService cs = new ContactService();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.appBackground,
        middle: Header(label: "Add Contact"),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 50, right: 16, bottom: 100),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: AppColors.darkOrange.withOpacity(0.2),
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
                  SizedBox(height: 50),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Column(
                              children: [
                                CustomInputField(
                                  label: "Full Name",
                                  placeHolder: "John Doe",
                                  controller: contactNameController,
                                ),
                                CustomInputField(
                                  label: "Bitcoin Address",
                                  placeHolder: "Enter Bitcoin address",
                                  controller: contactAddressController,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: GradientBtn(
                                    label: "ADD CONTACT",
                                    ontap: () {
                                      final name = contactNameController.text;
                                      final address =
                                          contactAddressController.text;
                                      if (name.isNotEmpty &&
                                          address.isNotEmpty) {
                                        cs.createRecord(name, address);
                                        Toast.show("Contact added.", context,
                                            duration: Toast.LENGTH_SHORT,
                                            gravity: Toast.BOTTOM);
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      } else {
                                        Toast.show(
                                            "Please fill in all the fields.",
                                            context,
                                            duration: Toast.LENGTH_SHORT,
                                            gravity: Toast.BOTTOM);
                                      }
                                    },
                                  ),
                                )
                              ],
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
}
