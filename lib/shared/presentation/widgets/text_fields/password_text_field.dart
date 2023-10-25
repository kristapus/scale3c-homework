import 'package:flutter/material.dart';
import 'package:scale3c_homework/shared/presentation/widgets/text_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      hintText: 'Password',
      obscureText: true,
      keyboardType: TextInputType.text,
    );
  }
}
