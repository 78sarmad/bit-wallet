import 'package:bitcoin_wallet/cubit/auth_cubit.dart';
import 'package:bitcoin_wallet/cubit/auth_progress_cubit.dart';
import 'package:bitcoin_wallet/pages/home.dart';
import 'package:bitcoin_wallet/pages/login.dart';
import 'package:bitcoin_wallet/pages/register.dart';
import 'package:bitcoin_wallet/pages/splash.dart';
import 'package:bitcoin_wallet/services/authentication_service.dart';
import 'package:bitcoin_wallet/utils/navigations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'utils/methods.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: CupertinoApp(
        title: 'Bitcoin Wallet',
        home: SplashScreen(),
        // home: AuthenticationWrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();

//     if (firebaseUser != null) {
//       Toast.show("Already signed in", context,
//           duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
//     } else {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
//     }
//   }
// }
