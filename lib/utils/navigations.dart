import 'package:flutter/material.dart';

class Navigations {
  static goToScreen(BuildContext context, Widget screen){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
  }
}