import 'package:flutter/material.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_input_text.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_title.dart';

class StepThreePage extends StatefulWidget {
  const StepThreePage({Key? key}) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(
          title: 'Qual ou quais\n',
          subtitle: 'ítens você quer dividir?',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text('1'),
              ),
              Expanded(
                flex: 3,
                child: StepInputText(
                  padding: EdgeInsets.zero,
                  onChanged: (value) {},
                  hintText: 'Ex: Picanha',
                  align: TextAlign.start,
                ),
              ),
              Expanded(
                child: StepInputText(
                  padding: EdgeInsets.zero,
                  onChanged: (value) {},
                  hintText: 'R\$ 0,00',
                  align: TextAlign.start,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_outline_outlined),
              )
            ],
          ),
        )
      ],
    );
  }
}
