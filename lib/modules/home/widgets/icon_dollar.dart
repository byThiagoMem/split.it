import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

enum IconDollarType { negative, positive }

class IconDollar extends StatelessWidget {
  final IconDollarType type;
  const IconDollar({Key? key, required this.type}) : super(key: key);

  Color get backgroundColor => type == IconDollarType.positive
      ? AppTheme.colors.greenTitle.withOpacity(.2)
      : AppTheme.colors.redNegative.withOpacity(.2);

  String get imagePath =>
      "assets/images/payments_${type == IconDollarType.positive ? 'green' : 'red'}.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(imagePath),
    );
  }
}
