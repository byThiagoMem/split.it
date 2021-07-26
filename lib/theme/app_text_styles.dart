import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get appBar;
  TextStyle get infoCardTitle;
  TextStyle get infoCardSubtitleGreen;
  TextStyle get infoCardSubtitleRed;
  TextStyle get eventTileTitle;
  TextStyle get eventTilesubtitle;
  TextStyle get eventTileMoney;
  TextStyle get eventTilePeople;
  TextStyle get stepperIndicatorPrimary;
  TextStyle get stepperIndicatorSecundary;
  TextStyle get stepperNextButtonDisabled;
  TextStyle get stepperNextButton;
  TextStyle get stepperTitle;
  TextStyle get stepperSubtitle;
  TextStyle get hintTextField;
  TextStyle get textField;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppTheme.colors.button);

  @override
  TextStyle get title => GoogleFonts.montserrat(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: AppTheme.colors.greenTitle);

  @override
  TextStyle get appBar => GoogleFonts.montserrat(
      fontSize: 24.0,
      color: AppTheme.colors.titleAppBar,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get infoCardTitle => GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.inforCardTitle);

  @override
  TextStyle get infoCardSubtitleGreen => GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppTheme.colors.greenTitle,
      height: 1.5);

  @override
  TextStyle get infoCardSubtitleRed => GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppTheme.colors.redNegative,
      height: 1.5);

  @override
  TextStyle get eventTileMoney => GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.eventTileMoney);

  @override
  TextStyle get eventTilePeople => GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.eventTilePeople);

  @override
  TextStyle get eventTileTitle => GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppTheme.colors.eventTileTitle);

  @override
  TextStyle get eventTilesubtitle => GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.eventTilesubtitle,
      height: 1.5);

  @override
  TextStyle get stepperIndicatorPrimary => GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppTheme.colors.stepperIndicatorPrimary);

  @override
  TextStyle get stepperIndicatorSecundary => GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.stepperIndicatorSecundary);

  @override
  TextStyle get stepperNextButton => GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppTheme.colors.stepperNextButton);

  @override
  TextStyle get stepperTitle => GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppTheme.colors.stepperTitle);

  @override
  TextStyle get stepperSubtitle => GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.stepperSubtitle);

  @override
  TextStyle get hintTextField => GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.hintTextField);

  @override
  TextStyle get textField => GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppTheme.colors.textField);

  @override
  TextStyle get stepperNextButtonDisabled => GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppTheme.colors.stepperNextButtonDisabled);
}
