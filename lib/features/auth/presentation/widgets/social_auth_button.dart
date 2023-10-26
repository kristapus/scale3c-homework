import 'package:flutter/material.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/shared/widgets/buttons/button.dart';

class SocialAuthButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget icon;

  const SocialAuthButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: context.colors.secondaryThin),
      ),
      child: icon,
    );
  }
}
