import 'package:flutter/material.dart';
import 'package:splitit/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:splitit/modules/home/widgets/app_bar/app_bar_state.dart';

import '../custom_card.dart';
import '../icon_dollar.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  final controller = AppBarController();

  @override
  void initState() {
    controller.getDashboard();
    controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.state.runtimeType) {
      case AppBarStateLoading:
        {
          return Align(
            alignment: Alignment(.1, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCard(
                  value: 0,
                  type: IconDollarType.positive,
                  isLoading: true,
                ),
                CustomCard(
                  value: 0,
                  type: IconDollarType.negative,
                  isLoading: true,
                ),
              ],
            ),
          );
        }
      case AppBarStateSuccess:
        {
          final dashboard = (controller.state as AppBarStateSuccess).dashboard;
          return Align(
            alignment: Alignment(.1, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCard(
                  value: dashboard.receive,
                  type: IconDollarType.positive,
                ),
                CustomCard(
                  value: -dashboard.send,
                  type: IconDollarType.negative,
                ),
              ],
            ),
          );
        }
      case AppBarStateFailure:
        {
          final message = (controller.state as AppBarStateFailure).message;
          return Center(child: Text(message));
        }
      default:
        return Container();
    }
  }
}
