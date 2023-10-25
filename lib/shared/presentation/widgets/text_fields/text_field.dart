import 'package:flutter/material.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;

  const AppTextField({
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.textField.copyWith(color: AppColors.darkGrey),
      decoration: InputDecoration(
        fillColor: AppColors.lightGrey,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.mediumGrey),
        contentPadding: const EdgeInsets.all(20),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      cursorColor: AppColors.mediumGrey,
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
