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
        labelText: "Gender",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: const [
        DropdownMenuItem(
          value: "male",
          child: Text("Male"),
        ),
        DropdownMenuItem(
          value: "female",
          child: Text("Female"),
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