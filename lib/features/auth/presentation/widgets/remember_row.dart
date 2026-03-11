import 'package:easy_localization/easy_localization.dart';
import 'package:flower_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class RememberMeRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onForgotPassword;

  const RememberMeRow({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 8),
             Text(
              "Remember me".tr(),
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onForgotPassword,
          child:  Text(
            AppStrings.forget.tr(),
            style: TextStyle(
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}