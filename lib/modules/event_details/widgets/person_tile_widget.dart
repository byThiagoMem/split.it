import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitit/modules/event_details/widgets/check_rounded_button/check_rouded_button.dart';
import 'package:splitit/shared/models/event_model.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/utils/formatters.dart';

class PersonTileWidget extends StatelessWidget {
  final FriendModel model;
  final double value;
  final Function(EventModel newEvent) onChanged;
  final EventModel event;

  const PersonTileWidget(
      {Key? key,
      required this.onChanged,
      required this.value,
      required this.model,
      required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 40.0,
        width: 40.0,
        child: Container(
          decoration: BoxDecoration(
            image: model.photoURL.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(model.photoURL), fit: BoxFit.cover)
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: model.photoURL.isEmpty ? Text(model.name[0]) : Container(),
        ),
      ),
      title: Text(
        model.name,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF666666),
        ),
      ),
      subtitle: Text(
        value.reais(),
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: model.isPaid ? Color(0xFF40B28C) : Color(0xFFE83F5B),
        ),
      ),
      trailing: CheckRoudedButton(
        event: event,
        friend: model,
        onChanged: onChanged,
      ),
    );
  }
}
