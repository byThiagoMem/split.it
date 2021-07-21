import 'package:flutter/material.dart';
import 'package:splitit/modules/home/widgets/custom_app_bar.dart';
import 'package:splitit/modules/login/models/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: CustomAppBar(
        size: MediaQuery.of(context).size.height * .30,
        user: user,
      ),
    );
  }
}
