// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? prefixicon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;

  const MyTextField({
    super.key,
    this.hintText,
    this.keyboardType,
    this. controller,
    this.prefixicon,
    this.suffixIcon,
     this.hintStyle,
  }); 

  @override
  Widget build(BuildContext context) {
    return TextField(
      
              
              decoration: InputDecoration(
                hintText: hintText,
                 hintStyle: hintStyle,
                prefixIcon: prefixicon,
                suffixIcon: suffixIcon,
                prefixIconConstraints: BoxConstraints(minWidth: 80),
                suffixIconConstraints: BoxConstraints(minWidth: 10),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.yellow),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            );
  }
}
