import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class SocialButtonWidget extends StatelessWidget {
  final String plataform;
  final String imagePath;
  final VoidCallback onTap;
  const SocialButtonWidget(
      {Key? key,
      required this.plataform,
      required this.imagePath,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * .09),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.colors.border),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 57,
                width: 57,
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Image.asset(
                      imagePath,
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 1,
                      color: AppTheme.colors.border,
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Text(
                'Entrar com $plataform',
                style: AppTheme.textStyles.button,
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      );
    });
  }
}
