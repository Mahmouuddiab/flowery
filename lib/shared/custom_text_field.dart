import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool obscureText ;
  Widget? suffixIcon;
  bool? isDense;
   CustomTextField({
     super.key,
     required this.label,
     required this.controller,
     this.validator,
     required this.obscureText,
     this.suffixIcon,
     this.isDense
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleMedium,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        isDense: isDense
      ),
    );
  }
}
