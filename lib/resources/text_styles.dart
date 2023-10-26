import 'package:flutter/material.dart';

extension TextStylesExtension on TextTheme {
  // Small
  static const double sSize = 14.0;

  TextStyle get sMedium => const TextStyle(
        fontSize: sSize,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      );

  // Medium
  static const double mSize = 16.0;

  TextStyle get mMedium => const TextStyle(
        fontSize: mSize,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      );

  TextStyle get mBold => const TextStyle(
        fontSize: mSize,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      );

  TextStyle get mXBold => const TextStyle(
        fontSize: mSize,
        fontWeight: FontWeight.w900,
        decoration: TextDecoration.none,
      );

  TextStyle get mXBoldClick => const TextStyle(
        fontSize: mSize,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
      );

  // Large
  static const double lSize = 18.0;

  TextStyle get lBold => const TextStyle(
        fontSize: lSize,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      );

  // Extra large
  static const double xlSize = 24.0;

  TextStyle get xlMedium => const TextStyle(
        fontSize: xlSize,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      );
}
