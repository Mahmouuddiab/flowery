import 'package:flower_app/core/utils/app_font_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
   CustomButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text,style: AppFontStyles.w400_16,)
      ),
    );
  }
}
