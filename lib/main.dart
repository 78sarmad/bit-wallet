import 'package:bitcoin_wallet/cubit/auth_cubit.dart';
import 'package:bitcoin_wallet/cubit/auth_progress_cubit.dart';
import 'package:bitcoin_wallet/pages/home.dart';
import 'package:bitcoin_wallet/pages/login.dart';
import 'package:bitcoin_wallet/pages/register.dart';
import 'package:bitcoin_wallet/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utils/methods.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AuthProgressCubit())
      ],
      child: CupertinoApp(
          title: 'Bitcoin Wallet',
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        ),
    );
  }
}

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    context.bloc<AuthCubit>().checkSignedInUser();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocListener<AuthProgressCubit, AuthProgressState>(
      listener: (context, state) {
        if(state is AuthProgressLoginError){
          Utils.showFirebaseErrorToast(state.error);
        }
        else if(state is AuthProgressRegisterError){
          Utils.showFirebaseErrorToast(state.error);
        }
        else if(state is AuthProgressLoginSuccess){
          Utils.showGeneralToast("Logged in successfully");
        }
        else if(state is AuthProgressRegisterSuccess){
          Utils.showGeneralToast("Registration successful");
        }
      },
      child: BlocBuilder <AuthCubit, AuthState>(
          builder: (context, state){
            if(state is AuthStateLoggedIn){
              return Home();
            }
            else if(state is AuthStateRegister){
              return Register();
            }
            else {
              return Login();
            }
          }
        ),
    );
  }
}
