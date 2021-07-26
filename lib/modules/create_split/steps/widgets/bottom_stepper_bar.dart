import 'package:flutter/material.dart';
import 'package:splitit/modules/create_split/steps/widgets/stepper_next_button.dart';
import 'package:splitit/theme/app_theme.dart';

class BottomStapperBar extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;
  final bool enabledButtons;

  const BottomStapperBar(
      {Key? key,
      required this.onTapCancel,
      required this.onTapNext,
      this.enabledButtons = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          StepperNextButton(
              label: 'CANCELAR', onTap: onTapCancel, enable: enabledButtons),
          Container(
            width: 1,
            height: 60,
            color: AppTheme.colors.divider,
          ),
          StepperNextButton(
              label: 'CONTINUAR', onTap: onTapNext, enable: enabledButtons),
        ],
      ),
    );
  }
}
