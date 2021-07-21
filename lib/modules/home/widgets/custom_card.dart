import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitit/theme/app_theme.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final bool positive;
  const CustomCard({Key? key, required this.image, required this.positive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.only(top: constraints.maxHeight * .05),
          child: Container(
            height: constraints.maxHeight * .79,
            width: 170,
            decoration: BoxDecoration(
              color: AppTheme.colors.backgroundPrimary,
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
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: positive
                          ? AppTheme.colors.backgroundSecundary.withOpacity(.16)
                          : AppTheme.colors.negative.withOpacity(.16),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(image),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        positive ? 'A receber' : 'A pagar',
                        style: AppTheme.textStyles.description,
                      ),
                      Text(
                        positive ? 'R\$ 124,00' : 'R\$ 48,00',
                        style: positive
                            ? GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.colors.green,
                                height: 1.5,
                              )
                            : GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.colors.negative,
                                height: 1.5,
                              ),
                      ),
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
