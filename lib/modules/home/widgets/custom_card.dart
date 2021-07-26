import 'package:flutter/material.dart';
import 'package:splitit/modules/home/widgets/icon_dollar.dart';
import 'package:splitit/modules/home/widgets/loading_widget.dart';
import 'package:splitit/theme/app_theme.dart';

enum IconType { positive, negative }

class CustomCard extends StatelessWidget {
  final double value;
  final bool isLoading;
  final IconDollarType type;
  const CustomCard(
      {Key? key,
      required this.value,
      required this.type,
      this.isLoading = false})
      : super(key: key);

  String get title => value >= 0 ? 'A receber' : 'A pagar';

  TextStyle get textStyle => value >= 0
      ? AppTheme.textStyles.infoCardSubtitleGreen
      : AppTheme.textStyles.infoCardSubtitleRed;

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.only(
            top: constraints.maxHeight * .05,
          ),
          child: Container(
            height: constraints.maxHeight * .79,
            width: sizeWidth * 0.42,
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 1,
                color: AppTheme.colors.border,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconDollar(type: type),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTheme.textStyles.infoCardTitle,
                      ),
                      if (isLoading) ...[
                        LoadingWidget(size: Size(98, 24))
                      ] else ...[
                        Text(
                          'R\$ ${value.toStringAsFixed(2)}',
                          style: textStyle,
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
