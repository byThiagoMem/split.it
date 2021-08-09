import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:splitit/modules/login/login_controller.dart';
import 'package:splitit/modules/login/login_service.dart';
import 'package:splitit/modules/login/login_state.dart';
import 'package:splitit/modules/login/widgets/social_button.dart';
import 'package:splitit/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
      service: LoginServiceImpl(),
    );
    autorun((_) {
      {
        if (controller.state is LoginStateSuccess) {
          final user = (controller.state as LoginStateSuccess).user;
          Navigator.pushReplacementNamed(context, '/home', arguments: user);
        }
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: LayoutBuilder(builder: (_, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: constraints.maxWidth * .1),
              child: Row(
                children: [
                  Container(
                    width: constraints.maxWidth * .6,
                    child: Text(
                      'Divida suas contas com seus amigos',
                      style: AppTheme.textStyles.title,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: constraints.maxWidth * .05),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/images/emoji.png",
                      height: constraints.maxHeight * .05,
                      width: constraints.maxWidth * .1,
                    ),
                    title: Container(
                      width: constraints.maxWidth * .6,
                      child: Text(
                        'Faça seu login com uma das contas abaixo',
                        style: AppTheme.textStyles.button,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * .04),
                Observer(
                  builder: (context) {
                    if (controller.state is LoginStateLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (controller.state is LoginStateFailure)
                      return Text(
                          (controller.state as LoginStateFailure).message);
                    else
                      return SocialButtonWidget(
                        onTap: () async {
                          controller.googleSignIn();
                        },
                        plataform: 'Google',
                        imagePath: 'assets/images/google.png',
                      );
                  },
                ),
                SizedBox(height: constraints.maxHeight * .02),
                SocialButtonWidget(
                  onTap: () async {},
                  plataform: 'Apple',
                  imagePath: 'assets/images/apple.png',
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
