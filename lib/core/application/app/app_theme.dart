import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return FlexThemeData.light();
  }

  static ThemeData get darkTheme {
    return FlexThemeData.dark();
  }
}
