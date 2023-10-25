import 'package:flutter/material.dart';
import 'package:scale3c_homework/shared/presentation/widgets/text_field.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      hintText: 'Usename',
      keyboardType: TextInputType.name,
    );
  }
}
