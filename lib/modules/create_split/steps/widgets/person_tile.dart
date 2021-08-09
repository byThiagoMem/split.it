import 'package:flutter/material.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/theme/app_theme.dart';

class PersonTile extends StatelessWidget {
  final FriendModel data;
  final bool isRemoved;
  final VoidCallback onPressed;

  const PersonTile(
      {Key? key,
      required this.data,
      this.isRemoved = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(data.photoURL), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8.0)),
      ),
      title: Text(
        data.name,
        style: isRemoved
            ? AppTheme.textStyles.selectedPersonTileTitle
            : AppTheme.textStyles.personTileTitle,
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: isRemoved
            ? Icon(
                Icons.remove,
                color: AppTheme.colors.iconRemove,
              )
            : Icon(
                Icons.add,
                color: AppTheme.colors.iconAdd,
              ),
      ),
    );
  }
}
