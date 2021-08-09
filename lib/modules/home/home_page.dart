import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:splitit/modules/event_details/event_details_page.dart';
import 'package:splitit/modules/home/home_controller.dart';
import 'package:splitit/modules/home/home_state.dart';
import 'package:splitit/modules/home/repositories/home_repository_firebase.dart';
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
  final controller = HomeController(repository: HomeRepositoryFirebase());

  @override
  void initState() {
    controller.getEvents();
    autorun((_) {
      controller.getEvents();
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
      body: RefreshIndicator(
        onRefresh: () => controller.getEvents(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: constraints.maxHeight * .2,
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Observer(
                      builder: (context) {
                        if (controller.state is HomeStateLoading) {
                          return Column(
                            children: List.generate(
                              6,
                              (index) => EventTile(
                                isLoading: true,
                                model: EventModel(),
                              ),
                            ),
                          );
                        } else if (controller.state is HomeStateSuccess) {
                          return Column(
                              children: (controller.state as HomeStateSuccess)
                                  .events
                                  .map(
                                    (e) => EventTile(
                                      model: e,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EventDetailsPage(
                                              event: e,
                                            ),
                                          ),
                                        );
                                        controller.getEvents();
                                      },
                                    ),
                                  )
                                  .toList());
                        } else if (controller.state is HomeStateFailure) {
                          return Text(
                              (controller.state as HomeStateFailure).message);
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
