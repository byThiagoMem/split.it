import 'package:flutter/material.dart';
import 'package:splitit/modules/create_split/create_split_controller.dart';
import 'package:splitit/modules/create_split/steps/one/step_one_page.dart';
import 'package:splitit/modules/create_split/steps/three/step_three_page.dart';
import 'package:splitit/modules/create_split/steps/two/step_two_page.dart';
import 'package:splitit/modules/create_split/steps/widgets/bottom_stepper_bar.dart';
import 'package:splitit/modules/create_split/steps/widgets/create_split_appbar.dart';
import 'package:splitit/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();
  late List<Widget> pages;

  var index = 0;

  void nextPage() {
    if (index < 2) {
      index++;
      setState(() {});
    }
  }

  void backPage() {
    if (index > 0) {
      index--;
      setState(() {});
    }
  }

  @override
  void initState() {
    pages = [
      StepOnePage(
        onChanged: (value) {
          controller.setEventName(value);
          setState(() {});
        },
      ),
      StepTwoPage(
        onChanged: (value) {
          controller.setEventName(value);
          setState(() {});
        },
      ),
      StepThreePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      appBar: CreateSplitAppBar(
        actualPage: index,
        onTapBack: backPage,
        size: pages.length,
      ),
      body: pages[index],
      bottomNavigationBar: BottomStapperBar(
        enabledButtons: controller.enableNavigateButton(),
        onTapCancel: () {},
        onTapNext: nextPage,
      ),
    );
  }
}
