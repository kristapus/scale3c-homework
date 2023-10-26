import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
