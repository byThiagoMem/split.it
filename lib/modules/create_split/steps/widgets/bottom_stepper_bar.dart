import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitit/modules/create_split/create_split_controller.dart';
import 'package:splitit/modules/create_split/steps/widgets/stepper_next_button.dart';
import 'package:splitit/theme/app_theme.dart';

class BottomStapperBar extends StatelessWidget {
  final CreateSplitController controller;

  const BottomStapperBar({Key? key, required this.controller})
      : super(key: key);

  void onTapNext() {
    if (controller.currentPage == 2) {
      controller.saveEvent();
    } else {
      controller.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      child: Observer(
        builder: (_) {
          return Column(
            children: [
              Container(
                height: 1,
                width: double.maxFinite,
                color: controller.enableNavigateButton
                    ? AppTheme.colors.divider
                    : AppTheme.colors.dividerDisabled,
              ),
              Row(
                children: [
                  StepperNextButton(
                    label: 'CANCELAR',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    enable: controller.enableNavigateButton,
                  ),
                  Container(
                    width: 1,
                    height: 60,
                    color: controller.enableNavigateButton
                        ? AppTheme.colors.divider
                        : AppTheme.colors.dividerDisabled,
                  ),
                  StepperNextButton(
                    label:
                        controller.currentPage == 2 ? 'FINALIZAR' : 'CONTINUAR',
                    colored: controller.currentPage == 2,
                    onTap: onTapNext,
                    enable: controller.enableNavigateButton,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
