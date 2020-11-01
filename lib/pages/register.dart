import 'package:bitcoin_wallet/pages/login.dart';
import 'package:bitcoin_wallet/services/auth_service.dart';
import 'package:bitcoin_wallet/services/check_connectivity.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/widgets/bit_coin_logo2.dart';
import 'package:bitcoin_wallet/widgets/rounded_square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Register extends StatelessWidget {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _pswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 60, bottom: 10),
                      child: BitCoinLogo2()),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 50),
                    child: Text(
                      "Register",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: screenWidth * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  width: 2, color: AppColors.lightGrey)),
                          child: CupertinoTextField(
                            controller: _nameController,
                            style: TextStyle(color: Colors.black),
                            decoration: BoxDecoration(color: Colors.white),
                            placeholder: "John Doe",
                            placeholderStyle:
                                TextStyle(color: AppColors.lightGrey),
                            suffix: Icon(
                              CupertinoIcons.person,
                              color: AppColors.lightGrey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: screenWidth * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Email",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  width: 2, color: AppColors.lightGrey)),
                          child: CupertinoTextField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: BoxDecoration(color: Colors.white),
                            placeholder: "johndoe@gmail.com",
                            placeholderStyle:
                                TextStyle(color: AppColors.lightGrey),
                            suffix: Icon(
                              CupertinoIcons.mail,
                              color: AppColors.lightGrey,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    width: screenWidth * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Password",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  width: 2, color: AppColors.lightGrey)),
                          child: CupertinoTextField(
                            style: TextStyle(color: Colors.black),
                            controller: _pswdController,
                            decoration: BoxDecoration(color: Colors.white),
                            placeholder: "********",
                            placeholderStyle:
                                TextStyle(color: AppColors.lightGrey),
                            suffix: Icon(
                              CupertinoIcons.padlock,
                              color: AppColors.lightGrey,
                            ),
                            obscureText: false,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      AppColors.darkOrange,
                      AppColors.lightOrange
                    ])),
                    child: FlatButton(
                      onPressed: () async {
                        final email = _emailController.text.trim();
                        final password = _pswdController.text.trim();
                        final name = _nameController.text.trim();

                        if (email.isNotEmpty && password.isNotEmpty) {
                          Connectivity conn = new Connectivity();
                          bool isConnected = conn.check();
                          if (!isConnected) {
                            Toast.show("No internet connection.", context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          } else {
                            await signUp(name, email, password);
                            // TODO: register wallet

                            Toast.show(
                                "Registration Successful. Please sign in.",
                                context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);

                            bool isSignedIn = await checkAuth();
                            if (isSignedIn) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return Login();
                                },
                              ));
                            }
                          }
                        } else {
                          Toast.show("Fill in all the fields", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                        }
                      },
                      child: Text(
                        "REGISTER",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      left: -10,
                      top: -60,
                      child:
                          Transform.rotate(angle: -45, child: RoundedSquare())),
                  Positioned(
                      right: -0,
                      bottom: -50,
                      child:
                          Transform.rotate(angle: -45, child: RoundedSquare())),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Container(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        TextSpan(
                            text: "Login",
                            style: TextStyle(
                                color: AppColors.darkOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18))
                      ])),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
