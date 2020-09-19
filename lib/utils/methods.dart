import 'package:bitcoin_wallet/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showFirebaseErrorToast(error){
    Fluttertoast.showToast(
      msg: error is String ? error : error,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG
    );
  }

  static showGeneralErrorToast(error){
    Fluttertoast.showToast(
      msg: error.error,
      backgroundColor: AppColors.darkOrange,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG
    );
  }

  static showGeneralToast(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.darkOrange,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT
    );
  }
}