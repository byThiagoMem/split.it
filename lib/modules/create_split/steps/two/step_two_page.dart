import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitit/modules/create_split/steps/two/step_two_controller.dart';
import 'package:splitit/modules/create_split/steps/widgets/person_tile.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_input_text.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_title.dart';

import '../../create_split_controller.dart';

class StepTwoPage extends StatefulWidget {
  final CreateSplitController controller;
  const StepTwoPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  late StepTwoController controller;

  @override
  void initState() {
    controller = StepTwoController(controller: widget.controller);
    controller.getFriends();
    super.initState();
  }

  @override
  void dispose() {
    controller.disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StepTitle(title: 'Com quem\n', subtitle: 'você quer dividir?'),
          SizedBox(height: 40),
          StepInputText(
            hintText: 'Nome da pessoa',
            onChanged: (value) {
              controller.onChange(value);
            },
          ),
          SizedBox(height: 35),
          Observer(
            builder: (_) {
              if (controller.selectedFriends.isEmpty) {
                return Container();
              } else {
                return Column(
                  children: [
                    ...controller.selectedFriends
                        .map((e) => PersonTile(
                              data: e,
                              isRemoved: true,
                              onPressed: () {
                                controller.removeFriend(e);
                              },
                            ))
                        .toList(),
                    SizedBox(height: 16),
                  ],
                );
              }
            },
          ),
          Observer(
            builder: (_) {
              if (controller.items.isEmpty) {
                return Text('Nenhum amigo encontrado');
              } else {
                return Column(
                  children: controller.items
                      .map(
                        (e) => PersonTile(
                          data: e,
                          onPressed: () {
                            controller.addFriend(e);
                          },
                        ),
                      )
                      .toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
