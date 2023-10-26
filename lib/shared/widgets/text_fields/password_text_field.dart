import 'package:flutter/material.dart';
import 'package:scale3c_homework/shared/widgets/text_fields/text_field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String? hint;

  const PasswordTextField({
    required this.controller,
    this.validator,
    this.hint = 'Password',
    super.key,
  });

  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: hint,
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: validator ?? emptyValidator,
    );
  }
}
