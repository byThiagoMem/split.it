import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitit/modules/create_split/create_split_controller.dart';

import 'package:splitit/theme/app_theme.dart';

class CreateSplitAppBar extends PreferredSize {
  final VoidCallback onTapBack;
  final CreateSplitController controller;
  final int size;

  CreateSplitAppBar({
    required this.onTapBack,
    required this.controller,
    required this.size,
  }) : super(
          preferredSize: Size.fromHeight(150),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BackButton(
                    onPressed: onTapBack,
                    color: AppTheme.colors.backButton,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Observer(
                    builder: (_) {
                      return Text.rich(
                        TextSpan(
                          text: ('0${controller.currentPage + 1} '),
                          style: AppTheme.textStyles.stepperIndicatorPrimary,
                          children: [
                            TextSpan(
                              text: '- 03',
                              style:
                                  AppTheme.textStyles.stepperIndicatorSecundary,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
}
