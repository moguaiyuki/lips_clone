import 'package:flutter/material.dart';

class LipsColors {
  const LipsColors._();
  static const Color brand = Color(0xFFED7987);
  static const Color brandSub = Color(0xFFF4F3F4);
  static const Color mainTextColor = Color(0xFF757575);

  static const Color tabLabelColor = Colors.white;
  static const Color tabUnselectedLableColor = Colors.black54;
}

class LipsTextStyle {
  const LipsTextStyle._();
  static const TextStyle tablabelStyle =
      TextStyle(fontSize: LipsFontSize.xxsmall);
}

class LipsFontSize {
  const LipsFontSize._();
  static const double xxxsmall = 10;
  static const double xxsmall = 12;
}
