import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {

  const CustomLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: 40,
        child: CircularProgressIndicator(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }
}