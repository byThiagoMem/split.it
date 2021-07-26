import 'package:flutter/material.dart';
import 'package:splitit/modules/create_split/steps/widgets/person_tile.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_input_text.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_title.dart';

class StepTwoPage extends StatefulWidget {
  final void Function(String value) onChanged;
  const StepTwoPage({Key? key, required this.onChanged}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(title: 'Com quem\n', subtitle: 'você quer dividir?'),
        SizedBox(height: 40),
        StepInputText(onChanged: widget.onChanged, hintText: 'Nome da pessoa'),
        SizedBox(height: 35),
        PersonTile(name: 'Thiago Mem'),
        PersonTile(name: 'Karen Cristina'),
        PersonTile(name: 'Daniel Moreira'),
        PersonTile(name: 'Weverton (Branco)'),
      ],
    );
  }
}
