import 'package:flutter/material.dart';
import 'package:splitit/modules/login/login_page.dart';
import 'package:splitit/modules/splash/splash_page.dart';

import 'modules/error/error.page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Split.it",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/error': (context) => ErrorPage(),
      },
    );
  }
}
