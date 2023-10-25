import 'package:flutter/material.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/shared/presentation/widgets/buttons/button.dart';

class SocialButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget icon;

  const SocialButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        side: BorderSide(width: 1, color: AppColors.thinGrey),
      ),
      child: icon,
    );
  }
}
