import 'package:flutter/material.dart';
import 'package:splitit/modules/create_split/create_split_controller.dart';
import 'package:splitit/shared/utils/formatters.dart';
import 'package:splitit/theme/app_theme.dart';

class CreateSplitSuccessPage extends StatelessWidget {
  final CreateSplitController controller;
  const CreateSplitSuccessPage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 1.0],
          transform: GradientRotation(2.35619),
          colors: [
            Color(0xFF40B38C),
            Color(0xFF45CC93),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/money.png',
                  height: 200,
                  width: 200,
                ),
              ],
            ),
            SizedBox(height: 48.0),
            Text(
              '${controller.event.friends.length} pessoas',
              style: AppTheme.textStyles.button.copyWith(
                color: AppTheme.colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '${controller.event.valueSplit.reais()}',
              style: AppTheme.textStyles.title.copyWith(
                color: AppTheme.colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'para cada um',
              style: AppTheme.textStyles.button.copyWith(
                color: AppTheme.colors.white,
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.event.friends
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 48.0,
                      width: 48.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(e.photoURL), fit: BoxFit.cover),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Ink(
            height: 76,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0.0, 1.0],
                transform: GradientRotation(2.35619),
                colors: [
                  Color(0xFF40B38C),
                  Color(0xFF45CC93),
                ],
              ),
            ),
            child: Center(
              child: Text(
                'OKAY :D)',
                style: AppTheme.textStyles.stepperNextButton
                    .copyWith(color: AppTheme.colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
