import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class StepInputText extends StatelessWidget {
  final void Function(String value) onChanged;
  final String hintText;
  final TextAlign align;
  final EdgeInsets? padding;

  const StepInputText(
      {Key? key,
      required this.onChanged,
      required this.hintText,
      this.align = TextAlign.center,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 64.0),
      child: TextField(
        onChanged: onChanged,
        textAlign: align,
        style: AppTheme.textStyles.textField,
        cursorColor: AppTheme.colors.darkGreen,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTheme.textStyles.hintTextField,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.inputBorder,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.inputBorder,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.inputBorder,
            ),
          ),
        ),
      ),
    );
  }
}
