import 'dart:async';
import 'package:bitcoin_wallet/pages/login.dart';
import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// bool isSigned = false;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bitcards.png"))),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: //isSigned ? Text("Signing in...") :
                      Text("Loading..."),
                ),
                LoadingBar(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LoadingBar extends StatefulWidget {
  @override
  _LoadingBarState createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      child: LinearProgressIndicator(
        value: progressValue,
        backgroundColor: AppColors.lightGrey,
        valueColor: AlwaysStoppedAnimation(AppColors.darkOrange),
      ),
    );
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (progressValue >= 1) {
          timer.cancel();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) {
              return Login();
            },
          ));
        } else {
          progressValue += 0.5;
        }
      });
    });
  }
}
