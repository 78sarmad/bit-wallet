import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;

  CustomInputField(
      {@required this.label,
      @required this.placeHolder,
      this.suffixIcon,
      this.keyboardType,
      this.controller});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: screenWidth * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Fonts.textFieldLabel),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 2, color: AppColors.lightGrey)),
            child: CupertinoTextField(
              style: TextStyle(color: Colors.black),
              decoration: BoxDecoration(color: Colors.white),
              controller: controller,
              placeholder: placeHolder,
              placeholderStyle: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: Fonts.textFieldPlaceholder),
              suffix: suffixIcon != null ? suffixIcon : Container(),
              keyboardType:
                  keyboardType != null ? keyboardType : TextInputType.text,
            ),
          )
        ],
      ),
    );
  }
}
