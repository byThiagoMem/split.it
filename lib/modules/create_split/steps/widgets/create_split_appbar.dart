import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';

class CreateSplitAppBar extends PreferredSize {
  final VoidCallback onTapBack;
  final int actualPage;
  final int size;
  CreateSplitAppBar({
    required this.onTapBack,
    required this.actualPage,
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
                  child: Text.rich(
                    TextSpan(
                      text: ('0${actualPage + 1} '),
                      style: AppTheme.textStyles.stepperIndicatorPrimary,
                      children: [
                        TextSpan(
                          text: '- 0$size',
                          style: AppTheme.textStyles.stepperIndicatorSecundary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
