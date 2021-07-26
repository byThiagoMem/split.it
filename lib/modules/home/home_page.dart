import 'package:flutter/material.dart';
import 'package:splitit/modules/home/home_controller.dart';
import 'package:splitit/modules/home/home_state.dart';
import 'package:splitit/modules/home/widgets/app_bar/app_bar_widget.dart';
import 'package:splitit/modules/home/widgets/event_tile.dart';
import 'package:splitit/modules/login/models/user_model.dart';
import 'package:splitit/shared/models/event_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getEvents();
    controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        size: MediaQuery.of(context).size.height * .30,
        user: user,
        onTapAddButton: () {
          Navigator.pushNamed(context, '/create_split');
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: constraints.maxHeight * .2,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (controller.state is HomeStateLoading) ...[
                    ...List.generate(
                        6,
                        (index) =>
                            EventTile(isLoading: true, model: EventModel()))
                  ] else if (controller.state is HomeStateSuccess) ...[
                    ...(controller.state as HomeStateSuccess)
                        .events
                        .map((e) => EventTile(model: e))
                        .toList(),
                  ] else if (controller.state is HomeStateFailure) ...[
                    Text((controller.state as HomeStateFailure).message)
                  ] else ...[
                    Container()
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
