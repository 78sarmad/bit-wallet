import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/custom_input_field.dart';
import 'package:bitcoin_wallet/utils/header.dart';
import 'package:bitcoin_wallet/widgets/gradient_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
        padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
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
                                ),
                                CustomInputField(
                                  label: "Bitcoin Address",
                                  placeHolder: "Enter Bitcoin address",
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: GradientBtn(
                                    label: "ADD CONTACT",
                                    ontap: () {
                                      //TODO: call contact service method
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
