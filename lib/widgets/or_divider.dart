import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Container(child: Text("OR"), margin: const EdgeInsets.symmetric(horizontal: 3),),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),

        Expanded(
          child: Container(height: 1, color: Colors.black, margin: const EdgeInsets.only(right: 3),)
        ),
      ],
    );
  }
}