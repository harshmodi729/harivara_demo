import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const MaterialColor appColor = MaterialColor(_appColorPrimaryValue, <int, Color>{
    50: Color(0xFFE2E2E9),
    100: Color(0xFFB8B7C8),
    200: Color(0xFF8887A4),
    300: Color(0xFF58577F),
    400: Color(0xFF353363),
    500: Color(_appColorPrimaryValue),
    600: Color(0xFF0F0D41),
    700: Color(0xFF0C0B38),
    800: Color(0xFF0A0830),
    900: Color(0xFF050421),
  });
  static const int _appColorPrimaryValue = 0xFF110F48;

  static Color scaffoldBackgroundColor = appColor.shade50;
  static const Color secondaryTextColor = Color(0xFFBEBDE1);
  static Color textFieldBorderColor = appColor.shade300;
  static const Color successColor = Color(0xFF56A94F);
  static const Color errorColor = Color(0xFFE50F0F);
}
