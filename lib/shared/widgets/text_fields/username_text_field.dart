import 'package:flutter/material.dart';
import 'package:scale3c_homework/shared/widgets/text_fields/text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;

  const EmailTextField({
    required this.controller,
    this.hint = 'Email',
    super.key,
  });

  static String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: hint,
      keyboardType: TextInputType.name,
      validator: validator,
    );
  }
}
