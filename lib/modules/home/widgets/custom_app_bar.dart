import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splitit/modules/home/widgets/custom_card.dart';
import 'package:splitit/modules/login/models/user_model.dart';
import 'package:splitit/theme/app_theme.dart';

class CustomAppBar extends PreferredSize {
  final UserModel user;
  final double size;
  CustomAppBar({required this.size, required this.user})
      : super(
          preferredSize: Size.fromHeight(size),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * .052,
                      right: constraints.maxWidth * .052,
                      top: constraints.maxHeight * .050,
                    ),
                    color: AppTheme.colors.backgroundSecundary,
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      user.photoUrl!,
                                      height: constraints.maxHeight * .30,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(width: constraints.maxWidth * .040),
                                  Text(
                                    user.name!.split(' ')[0],
                                    style: AppTheme.textStyles.name,
                                  ),
                                ],
                              ),
                              Container(
                                height: constraints.maxHeight * .26,
                                width: constraints.maxWidth * .12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppTheme.colors.backgroundPrimary
                                        .withOpacity(.4),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: AppTheme.colors.backgroundPrimary,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(.1, 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCard(
                          image: "assets/images/payments_green.png",
                          positive: true,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.04,
                        ),
                        CustomCard(
                          image: "assets/images/payments_red.png",
                          positive: false,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
}
