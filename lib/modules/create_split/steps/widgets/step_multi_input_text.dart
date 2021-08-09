import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:splitit/modules/create_split/steps/widgets/step_input_text.dart';

class StepMultiInputText extends StatefulWidget {
  final int count;
  final String? initialName;
  final double? initalValue;
  final ValueChanged<String> itemName;
  final ValueChanged<double> itemValue;
  final VoidCallback? onDelete;
  final bool isRemoved;

  StepMultiInputText(
      {Key? key,
      required this.count,
      required this.itemName,
      required this.itemValue,
      this.isRemoved = false,
      this.initialName,
      this.initalValue,
      this.onDelete})
      : super(key: key);

  @override
  _StepMultiInputTextState createState() => _StepMultiInputTextState();
}

class _StepMultiInputTextState extends State<StepMultiInputText> {
  late MoneyMaskedTextController valueInputTextController =
      MoneyMaskedTextController(
    initialValue: widget.initalValue ?? 0.0,
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text('${widget.count}'),
          ),
          Expanded(
            flex: 2,
            child: StepInputText(
              initalValue: widget.initialName,
              padding: EdgeInsets.zero,
              onChanged: (value) {
                widget.itemName(value);
              },
              hintText: 'Ex: Picanha',
              align: TextAlign.start,
            ),
          ),
          Expanded(
            child: StepInputText(
              textInputType: TextInputType.number,
              textController: valueInputTextController,
              padding: EdgeInsets.zero,
              onChanged: (_) {
                widget.itemValue(valueInputTextController.numberValue);
              },
              hintText: 'R\$ 0,00',
              align: TextAlign.start,
            ),
          ),
          widget.isRemoved
              ? IconButton(
                  onPressed: () {
                    if (widget.onDelete != null) {
                      widget.onDelete!();
                    }
                  },
                  icon: Icon(Icons.delete_outline_outlined),
                )
              : Container()
        ],
      ),
    );
  }
}
