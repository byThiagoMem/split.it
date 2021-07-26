import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splitit/modules/create_split/create_split_page.dart';
import 'package:splitit/modules/home/home_page.dart';
import 'package:splitit/modules/login/login_page.dart';
import 'package:splitit/modules/splash/splash_page.dart';

import 'modules/error/error.page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light));
    return MaterialApp(
      title: "Split.it",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/error': (context) => ErrorPage(),
        '/home': (context) => HomePage(),
        '/create_split': (context) => CreateSplitPage(),
      },
    );
  }
}
