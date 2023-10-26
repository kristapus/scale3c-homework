import 'package:flutter/material.dart';
import 'package:scale3c_homework/resources/text_styles.dart';

class FormErrorMessage extends StatelessWidget {
  final String message;

  const FormErrorMessage({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        message,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.mBold.copyWith(color: Colors.red),
      ),
    );
  }
}
