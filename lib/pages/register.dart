import 'package:bitcoin_wallet/cubit/auth_cubit.dart';
import 'package:bitcoin_wallet/cubit/auth_progress_cubit.dart';
import 'package:bitcoin_wallet/models/user.dart';
import 'package:bitcoin_wallet/pages/home.dart';
import 'package:bitcoin_wallet/pages/login.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:bitcoin_wallet/widgets/bit_coin_logo2.dart';
import 'package:bitcoin_wallet/widgets/custom_progress_indicator.dart';
import 'package:bitcoin_wallet/widgets/rounded_square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  final _pswdController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final _authCubit = context.bloc<AuthCubit>();
    final _authProgressCubit = context.bloc<AuthProgressCubit>();

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
                    child: BitCoinLogo2()
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text("Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
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
                          child: Text("Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(width: 2, color: AppColors.lightGrey)
                          ),
                          child: CupertinoTextField(
                            controller: _nameController,
                            style: TextStyle(color: Colors.black),
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            placeholder: "John Doe",
                            placeholderStyle: TextStyle(
                              color: AppColors.lightGrey
                            ),
                            suffix: Icon(CupertinoIcons.person,
                              color: AppColors.lightGrey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: screenWidth * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text("Email",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(width: 2, color: AppColors.lightGrey)
                          ),
                          child: CupertinoTextField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            placeholder: "johndoe@gmail.com",
                            placeholderStyle: TextStyle(
                              color: AppColors.lightGrey
                            ),
                            suffix: Icon(CupertinoIcons.mail,
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
                          child: Text("Password",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(width: 2, color: AppColors.lightGrey)
                          ),
                          child: CupertinoTextField(
                            style: TextStyle(color: Colors.black),
                            controller: _pswdController,
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            placeholderStyle: TextStyle(
                              color: AppColors.lightGrey
                            ),
                            suffix: Icon(CupertinoIcons.padlock,
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
                      gradient: LinearGradient(colors: [AppColors.darkOrange, AppColors.lightOrange])
                    ),
                    child: BlocBuilder<AuthProgressCubit, AuthProgressState>(

                      builder: (context, state) {
                        print("Auth State: ${state.runtimeType}");

                        return FlatButton(
                          onPressed: state is AuthProgressRegister ? null : (){
                            final email = _emailController.text.trim();
                            final password = _pswdController.text.trim();
                            final name = _nameController.text.trim();
                            final user = AppUser(
                              email: email,
                              name: name
                            );
    
                            if(email.isNotEmpty && password.isNotEmpty && name.isNotEmpty){
                              _authCubit.registerUser(context: context, user: user, password: password);
                            }else{
                              _authProgressCubit.emitRegisterErrors("Fill in all fields");
                            }
                          }, 
                          child: state is AuthProgressRegister ?
                           CustomProgressIndicator() : 
                           Text("REGISTER",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        );
                      },
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
                  child: Transform.rotate(
                    angle: -45,
                    child: RoundedSquare()
                  )
                ),
                Positioned(
                  right: -0,
                  bottom: -50,
                  child: Transform.rotate(
                    angle: -45,
                    child: RoundedSquare()
                  )
                ),
                GestureDetector(
                  onTap: (){
                    _authCubit.gotoLogin();
                  },
                  child: Container(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                            )
                          ),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: AppColors.darkOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            )
                          )
                        ]
                      )
                    ),
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