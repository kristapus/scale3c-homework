import 'package:flutter/material.dart';

class AppColors {
  static const _thinGrey = Color(0xFFE2E2E0);
  static const _lightGrey = Color(0xFFF7F7F7);
  static const _mediumGrey = Color(0xFFB0B0C3);
  static const _darkGrey = Color(0xFF838391);
  static const _heavyGrey = Color(0xFF525464);

  static const _peach = Color(0xFFFFB19D);
  static const _white = Color(0xFFFFFFFF);
  static const _green = Color(0xFF20C3AF);
}

// TODO: In order to have different schemes and custom var names in the future
extension ColorSchemeExtension on ColorScheme {
  Color get secondaryThin => AppColors._thinGrey;
  Color get secondaryLight => AppColors._lightGrey;
  Color get secondaryMedium => AppColors._mediumGrey;
  Color get secondaryDark => AppColors._darkGrey;
  Color get secondaryHeavy => AppColors._heavyGrey;

  Color get secondaryAccent => AppColors._peach;
  Color get primaryAccent => AppColors._white;

  Color get primaryColor => AppColors._green;
}
