import 'package:flutter/material.dart';
import 'package:splitit/shared/utils/formatters.dart';
import 'package:splitit/theme/app_theme.dart';

class ItemTileWidget extends StatelessWidget {
  final String name;
  final double value;
  final bool hasDivider;

  const ItemTileWidget(
      {Key? key,
      required this.name,
      required this.value,
      this.hasDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: AppTheme.textStyles.eventTileTitle,
              ),
              Text(
                value.reais(),
                style: AppTheme.textStyles.eventTileTitle,
              ),
            ],
          ),
          if (hasDivider) ...[
            SizedBox(height: 12),
            Divider(
              thickness: 1,
              indent: 0,
              height: 1,
            ),
          ]
        ],
      ),
    );
  }
}
