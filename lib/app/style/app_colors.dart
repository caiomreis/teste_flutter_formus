import 'package:Formus/app/style/app_colors_abstract.dart';
import 'package:flutter/services.dart';

class _AppColorsThemeBase implements AppColorsTheme {
  @override
  AppColorsTheme copyWith({
    AppColors? gray,
    AppColors? blue,
    AppBasicColors? neutral,
    AppColorStatus? status,
  }) {
    return copyWith(
      gray: gray,
      blue: blue,
      neutral: neutral,
      status: status,
    );
  }

  @override
  AppColors get blue => const AppColors(
        light: Color(0xFF00b4fc),
        base: Color(0xFF005bc5),
        medium: Color(0xFF012677),
        strong: Color(0xFF001449),
      );
  @override
  AppColors get gray => const AppColors(
        light: Color(0xFFF8F9FA),
        base: Color(0xFF858E96),
        medium: Color(0xFF4F4F4F),
        strong: Color(0xFF212529),
      );

  @override
  AppBasicColors get neutral => const AppBasicColors(
        white: Color(0xFFFFFFFF),
        black: Color(0xFF212529),
      );

  @override
  AppColorStatus get status => const AppColorStatus(
        success: Color(0xFF28F282),
        error: Color(0xFFFF7456),
        info: Color(0xFF5393FF),
        waring: Color(0xFFF9C43A),
      );
}

extension AppColorsExtension on AppColorsTheme {
  SystemUiOverlayStyle get systemUiOverlayStyle {
    return SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: FormusColors.theme.blue.base,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: FormusColors.theme.neutral.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }
}

class FormusColors {
  static final AppColorsTheme theme = _AppColorsThemeBase();
}
