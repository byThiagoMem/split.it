import 'package:flutter/material.dart';

abstract class AppColors {
  Color get white;
  Color get darkGreen;
  Color get greenTitle;
  Color get button;
  Color get border;
  Color get redNegative;
  Color get titleAppBar;
  Color get inforCardTitle;
  Color get eventTileTitle;
  Color get eventTilesubtitle;
  Color get eventTileMoney;
  Color get eventTilePeople;
  Color get divider;
  Color get stepperIndicatorPrimary;
  Color get stepperIndicatorSecundary;
  Color get stepperNextButtonDisabled;
  Color get stepperNextButton;
  Color get backButton;
  Color get stepperTitle;
  Color get stepperSubtitle;
  Color get hintTextField;
  Color get textField;
  Color get inputBorder;
}

class AppColorsDefault implements AppColors {
  @override
  Color get white => Color(0xFFFFFFFF);

  @override
  Color get darkGreen => Color(0xFF45CC93);

  @override
  Color get greenTitle => Color(0xFF40B38C);

  @override
  Color get button => Color(0xFF666666);

  @override
  Color get border => Color(0xFFDCE0E5);

  @override
  Color get redNegative => Color(0xFFE83F5B);

  @override
  Color get titleAppBar => Color(0xFFFFFFFF);

  @override
  Color get inforCardTitle => Color(0xFF666666);

  @override
  Color get eventTileMoney => Color(0xFF666666);

  @override
  Color get eventTilePeople => Color(0xFFA4B2AE);

  @override
  Color get eventTileTitle => Color(0xFF455250);

  @override
  Color get eventTilesubtitle => Color(0xFF666666);

  @override
  Color get divider => Color(0xFF666666);

  @override
  Color get stepperIndicatorPrimary => Color(0xFF3CAB82);

  @override
  Color get stepperIndicatorSecundary => Color(0xFF666666);

  @override
  Color get backButton => Color(0xFF666666);

  @override
  Color get stepperNextButton => Color(0xFF455250);

  @override
  Color get stepperSubtitle => Color(0xFF455250);

  @override
  Color get stepperTitle => Color(0xFF455250);

  @override
  Color get hintTextField => Color(0xFF666666);

  @override
  Color get textField => Color(0xFF455250);

  @override
  Color get inputBorder => Color(0xFF455250);

  @override
  Color get stepperNextButtonDisabled => Color(0xFF666666);
}
