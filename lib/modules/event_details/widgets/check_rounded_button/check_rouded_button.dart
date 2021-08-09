import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:splitit/modules/event_details/widgets/check_rounded_button/check_rouded_controller.dart';
import 'package:splitit/shared/models/event_model.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';
import 'package:splitit/theme/app_theme.dart';

class CheckRoudedButton extends StatefulWidget {
  final EventModel event;
  final FriendModel friend;
  final Function(EventModel newEvent) onChanged;

  const CheckRoudedButton(
      {Key? key,
      required this.event,
      required this.friend,
      required this.onChanged})
      : super(key: key);

  @override
  _CheckRoudedButtonState createState() => _CheckRoudedButtonState();
}

class _CheckRoudedButtonState extends State<CheckRoudedButton> {
  late CheckRoundedController controller;

  Color get backgroundColor => controller.status == CheckRoundedStatus.success
      ? Color(0xFF40B28C).withOpacity(.16)
      : Color(0xFF455250).withOpacity(.08);

  Color get centerColor => controller.status == CheckRoundedStatus.success
      ? Color(0xFF40B28C)
      : AppTheme.colors.white;

  @override
  void initState() {
    controller = CheckRoundedController(
      repository: FirebaseRepository(),
      event: widget.event,
    );
    if (widget.friend.isPaid) {
      controller.status = CheckRoundedStatus.success;
    }
    autorun((_) {
      if (controller.status == CheckRoundedStatus.success ||
          controller.status == CheckRoundedStatus.empty)
        widget.onChanged(controller.event);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return InkWell(
          onTap: () {
            controller.update(widget.friend);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: centerColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Center(
                  child: controller.status == CheckRoundedStatus.success
                      ? Icon(
                          Icons.check,
                          color: AppTheme.colors.white,
                          size: 12,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xFFC0CCC9), width: 2),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
