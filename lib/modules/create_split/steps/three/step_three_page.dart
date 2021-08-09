import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:splitit/modules/create_split/create_split_controller.dart';
import 'package:splitit/modules/create_split/steps/three/step_three_controller.dart';
import 'package:splitit/modules/create_split/steps/widgets/add_text_button.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_multi_input_text.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_title.dart';

class StepThreePage extends StatefulWidget {
  final CreateSplitController createController;
  const StepThreePage({Key? key, required this.createController})
      : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  final controller = StepThreeController();
  late ReactionDisposer _disposer;

  @override
  void initState() {
    _disposer = autorun((_) {
      widget.createController.onChanged(items: controller.items.toList());
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StepTitle(
            title: 'Qual ou quais\n',
            subtitle: 'ítens você quer dividir?',
          ),
          Observer(
            builder: (_) {
              return StepMultiInputText(
                key: UniqueKey(),
                count: controller.currentIndex,
                itemName: (value) {
                  controller.onChanged(name: value);
                },
                itemValue: (value) {
                  controller.onChanged(value: value);
                },
              );
            },
          ),
          Observer(
            builder: (_) => controller.showButton
                ? AddTextButton(
                    label: 'Adicionar',
                    onPressed: () => controller.addItem(),
                  )
                : Container(),
          ),
          SizedBox(height: 24.0),
          Observer(
            builder: (_) => Column(
              children: [
                for (var i = 0; i < controller.items.length; i++)
                  StepMultiInputText(
                    key: Key([i].hashCode.toString()),
                    isRemoved: true,
                    initialName: controller.items[i].name,
                    initalValue: controller.items[i].value,
                    count: i + 1,
                    itemName: (value) {
                      controller.editingItem(i, name: value);
                    },
                    itemValue: (value) {
                      controller.editingItem(i, value: value);
                    },
                    onDelete: () {
                      controller.removeItem(i);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
