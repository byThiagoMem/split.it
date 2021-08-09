import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class StepInputText extends StatelessWidget {
  final void Function(String value) onChanged;
  final String hintText;
  final TextAlign align;
  final String? initalValue;
  final EdgeInsets? padding;
  final TextEditingController? textController;
  final TextInputType? textInputType;

  const StepInputText(
      {Key? key,
      required this.onChanged,
      required this.hintText,
      this.align = TextAlign.center,
      this.padding,
      this.textController,
      this.textInputType,
      this.initalValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 64.0),
      child: TextFormField(
        initialValue: initalValue,
        keyboardType: textInputType ?? null,
        controller: textController,
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
