import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      await Future.delayed(Duration(seconds: 3))
          .whenComplete(() => Navigator.pushNamed(context, '/login'));
    } on Exception catch (_) {
      Navigator.pushNamed(context, '/error');
    }
  }

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            gradient: AppTheme.gradients.background,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          "assets/images/rectangle_esq.png",
                          height: constraints.maxHeight * .15,
                          width: constraints.maxWidth * .6,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          "assets/images/rectangle_esq.png",
                          height: constraints.maxHeight * .1,
                          width: constraints.maxWidth * .4,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/images/logo.png", height: 112, width: 128),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Opacity(
                        opacity: 0.35,
                        child: Image.asset(
                          "assets/images/rectangle_dir.png",
                          height: constraints.maxHeight * .15,
                          width: constraints.maxWidth * .6,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/images/rectangle_dir.png",
                          height: constraints.maxHeight * .1,
                          width: constraints.maxWidth * .4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
