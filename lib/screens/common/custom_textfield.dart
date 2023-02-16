import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final bool? obsecure;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    this.keyboardType,
    this.hintText,
    this.obsecure = false,
    this.controller,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obsecure!,
      controller: controller,

      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),

      ),
    );
  }
}