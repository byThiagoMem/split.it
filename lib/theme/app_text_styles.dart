import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get name;
  TextStyle get description;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppTheme.colors.button);

  @override
  TextStyle get title => GoogleFonts.montserrat(
      fontSize: 40, fontWeight: FontWeight.w700, color: AppTheme.colors.title);

  @override
  TextStyle get name => GoogleFonts.montserrat(
      fontSize: 24.0,
      color: AppTheme.colors.backgroundPrimary,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get description => GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.button,
      );
}
