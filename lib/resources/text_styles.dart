import 'package:flutter/material.dart';

extension TextStylesExtension on TextTheme {
  TextStyle get textField => const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, decoration: TextDecoration.none);

  // Naming: sizeBoldness

  // Size - m

  static const double mSize = 16.0;

  TextStyle get mMedium => const TextStyle(fontSize: mSize, fontWeight: FontWeight.w500, decoration: TextDecoration.none);

  TextStyle get mBold => const TextStyle(fontSize: mSize, fontWeight: FontWeight.w700, decoration: TextDecoration.none);

  TextStyle get mXBold => const TextStyle(fontSize: mSize, fontWeight: FontWeight.w900, decoration: TextDecoration.none);

  TextStyle get mXBoldClick => const TextStyle(fontSize: mSize, fontWeight: FontWeight.w700, decoration: TextDecoration.underline);

  // Size - l

  static const double lSize = 18.0;

  TextStyle get lBold => const TextStyle(fontSize: lSize, fontWeight: FontWeight.w700, decoration: TextDecoration.none);
}