import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight * 1,
            width: constraints.maxWidth * .13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppTheme.colors.white.withOpacity(.4),
              ),
            ),
            child: Icon(
              Icons.add,
              color: AppTheme.colors.white,
              size: 20,
            ),
          );
        },
      ),
    );
  }
}
