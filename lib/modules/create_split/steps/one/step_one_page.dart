import 'package:flutter/material.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_input_text.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_title.dart';

class StepOnePage extends StatefulWidget {
  final void Function(String value) onChanged;
  const StepOnePage({Key? key, required this.onChanged}) : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(title: 'Qual o nome\n', subtitle: 'do evento?'),
        SizedBox(height: 40),
        StepInputText(onChanged: widget.onChanged, hintText: 'Ex. Churrasco'),
      ],
    );
  }
}
