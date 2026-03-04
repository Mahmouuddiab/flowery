import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  TextEditingController controller = TextEditingController();
   HomeAppBar({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SvgPicture.asset(AppImages.logo),
        Expanded(
          child: CustomTextField(
              label: "Search",
              controller: controller,
              obscureText: false,
              suffixIcon: Icon(Icons.search),
              isDense: true,
          ),
        )
      ],
    );
  }
}
