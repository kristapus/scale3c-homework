import 'package:flutter/material.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/widgets/buttons/button.dart';

class AppTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final TextStyle? textStyle;

  final Color? backgroundColor;
  final OutlinedBorder? shape;

  const AppTextButton({
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.shape,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? context.colors.primary,
      shape: shape,
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.mBold.copyWith(color: context.colors.primaryAccent),
      ),
    );
  }
}
