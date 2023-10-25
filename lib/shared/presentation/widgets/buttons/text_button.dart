import 'package:flutter/material.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/presentation/widgets/buttons/button.dart';

class AppTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  final Color? backgroundColor;

  const AppTextButton({
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.green,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      child: Text(
        text,
        style: Theme.of(context).textTheme.mBold.copyWith(color: AppColors.white),
      ),
    );
  }
}
