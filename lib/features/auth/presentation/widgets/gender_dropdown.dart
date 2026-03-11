import 'package:easy_localization/easy_localization.dart';
import 'package:flower_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final Function(String?) onChanged;

  const GenderDropdown({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      decoration: InputDecoration(
        labelText: AppStrings.gender.tr(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items:  [
        DropdownMenuItem(
          value: "male",
          child: Text(AppStrings.male.tr()),
        ),
        DropdownMenuItem(
          value: "female",
          child: Text(AppStrings.female.tr()),
        ),
      ],
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return "Please select gender";
        }
        return null;
      },
    );
  }
}