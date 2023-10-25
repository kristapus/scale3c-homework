import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;

  final OutlinedBorder shape;
  final double minHeight;
  final double minWidth;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const Button({
    required this.onPressed,
    required this.child,
    this.shape = const RoundedRectangleBorder(),
    this.minHeight = 60,
    this.minWidth = double.infinity,
    this.padding,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: shape,
        backgroundColor: backgroundColor,
        minimumSize: Size(minWidth, minHeight),
        padding: padding,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
