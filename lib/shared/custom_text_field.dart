import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool obscureText ;
  Widget? suffixIcon;
   CustomTextField({
     super.key,
     required this.label,
     required this.controller,
     this.validator,
     required this.obscureText,
     this.suffixIcon
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon
      ),
    );
  }
}
