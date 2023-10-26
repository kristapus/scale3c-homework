import 'package:flutter/material.dart';
import 'package:scale3c_homework/resources/images.dart';
import 'package:scale3c_homework/shared/widgets/buttons/button.dart';

class AppBarButton extends StatelessWidget {
  final AppImages icon;
  final void Function() onPressed;
  final EdgeInsets? padding;

  const AppBarButton({
    required this.icon,
    required this.onPressed,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      minWidth: 0,
      padding: padding,
      onPressed: onPressed,
      shape: const RoundedRectangleBorder(),
      child: icon.image(),
    );
  }
}
