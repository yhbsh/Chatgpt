import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static String get _dinNextFontFamily => 'DINNEXT';

  static ThemeData get lightTheme {
    return FlexThemeData.light(
      scheme: FlexScheme.greyLaw,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 9,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        inputDecoratorBorderType: FlexInputBorderType.underline,
        inputDecoratorFillColor: Colors.transparent,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: _dinNextFontFamily,
    );
  }

  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      scheme: FlexScheme.greyLaw,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 15,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
        inputDecoratorBorderType: FlexInputBorderType.underline,
        inputDecoratorFillColor: Colors.transparent,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: _dinNextFontFamily,
    );
  }
}
