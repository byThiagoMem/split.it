import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class StepperNextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool enable;
  const StepperNextButton(
      {Key? key, required this.label, required this.onTap, this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: enable ? onTap : null,
        child: Text(
          label,
          style: enable
              ? AppTheme.textStyles.stepperNextButton
              : AppTheme.textStyles.stepperNextButtonDisabled,
        ),
      ),
    );
  }
}
