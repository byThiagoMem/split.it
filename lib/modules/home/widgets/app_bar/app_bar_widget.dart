import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splitit/modules/home/widgets/add_button.dart';
import 'package:splitit/modules/home/widgets/bottom_app_bar/bottom_app_bar_widget.dart';
import 'package:splitit/modules/login/models/user_model.dart';
import 'package:splitit/theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final double size;
  final VoidCallback onTapAddButton;
  AppBarWidget(
      {required this.onTapAddButton, required this.size, required this.user})
      : super(
          preferredSize: Size.fromHeight(size),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * .040,
                      right: constraints.maxWidth * .040,
                      top: constraints.maxHeight * .18,
                    ),
                    color: AppTheme.colors.darkGreen,
                    child: Column(
                      children: [
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              user.photoUrl!,
                              height: constraints.maxHeight * .30,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            user.name!.split(' ')[0],
                            style: AppTheme.textStyles.appBar,
                          ),
                          trailing: AddButton(
                            onTap: onTapAddButton,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomAppBarWidget(),
                ],
              );
            },
          ),
        );
}
