import 'package:bitcoin_wallet/pages/home.dart';
import 'package:bitcoin_wallet/pages/register.dart';
import 'package:bitcoin_wallet/services/auth_service.dart';
import 'package:bitcoin_wallet/services/check_connectivity.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:bitcoin_wallet/widgets/bit_coin_logo2.dart';
import 'package:bitcoin_wallet/widgets/rounded_square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Login extends StatelessWidget {
  final _emailTxtController = TextEditingController();
  final _pswdTxtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: BitCoinLogo2()),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      "Login",
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
                    margin: const EdgeInsets.only(bottom: 10),
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
                            controller: _emailTxtController,
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
                    margin: const EdgeInsets.only(bottom: 20),
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
                            controller: _pswdTxtController,
                            decoration: BoxDecoration(color: Colors.white),
                            placeholder: "********",
                            placeholderStyle:
                                TextStyle(color: AppColors.lightGrey),
                            suffix: Icon(
                              CupertinoIcons.padlock,
                              color: AppColors.lightGrey,
                            ),
                            obscureText: true,
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
                        Toast.show("Trying to sign in...", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

                        final email = _emailTxtController.text.trim();
                        final password = _pswdTxtController.text.trim();

                        // TODO: reverse check
                        if (email.isNotEmpty && password.isNotEmpty) {
                          Connectivity conn = new Connectivity();
                          bool isConnected = conn.check();
                          if (!isConnected) {
                            Toast.show("No internet connection.", context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          } else {
                            // await signIn("sarmad@gmail.com", "123456");
                            await signIn(email, password);

                            bool isSignedIn = await checkAuth();
                            if (isSignedIn) {
                              Toast.show("Sign in successful.", context,
                                  duration: Toast.LENGTH_LONG,
                                  gravity: Toast.BOTTOM);

                              final name = await checkDisplayName();
                              final email = await checkDisplayEmail();

                              Navigations.goToScreen(
                                  context, Home(name: name, email: email));
                            } else {
                              Toast.show("Incorrect email or password", context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.BOTTOM);
                              Navigator.of(context).pop();
                            }
                          }
                        } else {
                          Toast.show("Fill in all the fields", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                        }
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Stack(
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
                    Navigations.goToScreen(context, Register());
                  },
                  child: Container(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                              color: AppColors.darkOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))
                    ])),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
