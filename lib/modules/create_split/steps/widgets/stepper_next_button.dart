import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class StepperNextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool enable;
  final bool colored;

  const StepperNextButton(
      {Key? key,
      required this.label,
      required this.onTap,
      this.enable = true,
      this.colored = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: enable ? onTap : null,
        child: Container(
          height: 60,
          child: Center(
            child: Text(
              label,
              style: enable
                  ? colored
                      ? AppTheme.textStyles.stepperNextButton
                          .copyWith(color: AppTheme.colors.iconAdd)
                      : AppTheme.textStyles.stepperNextButton
                  : AppTheme.textStyles.stepperNextButtonDisabled,
            ),
          ),
        ),
      ),
    );
  }
}
