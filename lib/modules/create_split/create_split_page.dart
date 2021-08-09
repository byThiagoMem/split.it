import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:splitit/modules/create_split/create_split_controller.dart';
import 'package:splitit/modules/create_split/steps/one/step_one_page.dart';
import 'package:splitit/modules/create_split/steps/three/step_three_page.dart';
import 'package:splitit/modules/create_split/steps/two/step_two_page.dart';
import 'package:splitit/modules/create_split/steps/widgets/bottom_stepper_bar.dart';
import 'package:splitit/modules/create_split/steps/widgets/create_split_appbar.dart';
import 'package:splitit/modules/create_split_success/create_split_success_page.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';
import 'package:splitit/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController(repository: FirebaseRepository());
  late List<Widget> pages;
  late ReactionDisposer _disposer;

  @override
  void initState() {
    pages = [
      StepOnePage(
        controller: controller,
      ),
      StepTwoPage(
        controller: controller,
      ),
      StepThreePage(
        createController: controller,
      ),
    ];
    _disposer = autorun(
      (_) {
        if (controller.status == CreateSplitStatus.success) {
          BotToast.closeAllLoading();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CreateSplitSuccessPage(controller: controller),
            ),
          );
        } else if (controller.status == CreateSplitStatus.success) {
          BotToast.closeAllLoading();
          BotToast.showText(
              text: 'Não foi possível cadastrar esse vento',
              contentColor: Colors.red);
        } else if (controller.status == CreateSplitStatus.loading) {
          BotToast.showLoading();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  bool backNavigate() {
    if (controller.currentPage == 0) {
      return true;
    } else {
      controller.backPage();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => backNavigate(),
      child: Scaffold(
        backgroundColor: AppTheme.colors.white,
        appBar: CreateSplitAppBar(
          controller: controller,
          onTapBack: () {
            if (backNavigate()) {
              Navigator.pop(context);
            }
          },
          size: pages.length,
        ),
        body: Observer(
          builder: (_) {
            final index = controller.currentPage;
            return pages[index];
          },
        ),
        bottomNavigationBar: BottomStapperBar(
          controller: controller,
        ),
      ),
    );
  }
}
