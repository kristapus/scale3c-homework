import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget? title;
  final Color? appBarColor;

  final Widget body;
  final Color? backgroundColor;

  const BasePage({
    required this.title,
    this.appBarColor,
    required this.body,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: title,
        centerTitle: true,
        titleSpacing: 0,
        leadingWidth: 0,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}
