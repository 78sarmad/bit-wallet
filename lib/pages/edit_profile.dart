import 'package:bitcoin_wallet/pages/home.dart';
import 'package:bitcoin_wallet/pages/login.dart';
import 'package:bitcoin_wallet/services/auth_service.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();

  String name, email;
  AddContact({Key key, this.name, this.email}) : super(key: key);
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
        middle: Text(
          "Profile Settings",
          style: TextStyle(color: Colors.black, fontSize: Fonts.pageHeadText),
        ),
        actionsForegroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
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
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: AppColors.darkOrange,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              buildTextField("Full Name", widget.name, false, nameController,
                  Icons.remove_red_eye),
              buildTextField("Email Address", widget.email, false,
                  emailController, Icons.email),
              buildTextField("Password", "********", true, passwordController,
                  Icons.lock_open),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      String oldName = widget.name;
                      String oldEmail = widget.email;

                      if (name.isNotEmpty && name != oldName)
                        setName(name);
                      else
                        name = oldName;

                      if (password.isNotEmpty) setPassword(password);

                      if (email.isNotEmpty && oldEmail != email) {
                        setEmail(email);
                        Toast.show(
                            "Email changed. Please sign in again.", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Login();
                          },
                        ));
                      } else {
                        Toast.show("Profile updated.", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Home(name: name, email: oldEmail);
                          },
                        ));
                      }
                    },
                    color: AppColors.darkOrange,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "UPDATE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
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
