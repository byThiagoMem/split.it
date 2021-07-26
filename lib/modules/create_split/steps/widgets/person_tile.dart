import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {
  final String name;
  final bool isRemoved;
  const PersonTile({Key? key, required this.name, this.isRemoved = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        color: Colors.grey[300],
      ),
      title: Text(name),
      trailing: IconButton(
        onPressed: () {},
        icon: isRemoved ? Icon(Icons.remove) : Icon(Icons.add),
      ),
    );
  }
}
