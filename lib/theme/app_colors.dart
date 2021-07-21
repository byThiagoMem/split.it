import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundPrimary;
  Color get backgroundSecundary;
  Color get green;
  Color get title;
  Color get button;
  Color get border;
  Color get negative;
}

class AppColorsDefault implements AppColors {
  @override
  Color get backgroundPrimary => Color(0xFFFFFFFF);

  @override
  Color get backgroundSecundary => Color(0xFF45CC93);

  @override
  Color get title => Color(0xFF40B38C);

  @override
  Color get button => Color(0xFF666666);

  @override
  Color get border => Color(0xFFDCE0E5);

  @override
  Color get negative => Color(0xFFE83F5B);

  @override
  Color get green => Color(0xFF40B28C);
}
