import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:splitit/modules/event_details/event_details_controller.dart';
import 'package:splitit/modules/event_details/event_details_status.dart';
import 'package:splitit/modules/event_details/widgets/item_tile.dart';
import 'package:splitit/modules/event_details/widgets/person_tile_widget.dart';
import 'package:splitit/shared/models/event_model.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';
import 'package:splitit/shared/utils/formatters.dart';
import 'package:splitit/theme/app_theme.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel event;
  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final controller = EventDetailsController(repository: FirebaseRepository());
  late ReactionDisposer _disposer;
  late EventModel event;

  @override
  void initState() {
    event = widget.event;
    _disposer = autorun(
      (_) {
        if (controller.status.runtimeType == EventDetailsStatusSuccess) {
          BotToast.closeAllLoading();
          Navigator.pop(context);
        } else if (controller.status.runtimeType == EventDetailsStatusFailure) {
          BotToast.closeAllLoading();
          BotToast.showText(
              text: 'Não foi possível deletar o evento',
              contentColor: Colors.red);
        } else if (controller.status.runtimeType == EventDetailsStatusLoading) {
          BotToast.showLoading();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.white,
        elevation: 0,
        title: Text(
          event.name,
          style: AppTheme.textStyles.appBarEventDetail,
        ),
        centerTitle: true,
        leading: BackButton(color: AppTheme.colors.backButton),
        actions: [
          IconButton(
            onPressed: () {
              controller.delete(event.id);
            },
            icon: Icon(
              Icons.delete,
              color: AppTheme.colors.backButton,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 8,
              color: Color(0xFF455250).withOpacity(.08),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'INTEGRANTES',
                      style: AppTheme.textStyles.eventDetailsTitle,
                    ),
                    ...event.friends
                        .map((e) => PersonTileWidget(
                              key: UniqueKey(),
                              event: event,
                              model: e,
                              value: event.valueSplit,
                              onChanged: (newEvent) {
                                event = newEvent;
                                setState(() {});
                              },
                            ))
                        .toList()
                  ],
                ),
              ),
            ),
            Container(
              height: 8,
              color: Color(0xFF455250).withOpacity(.08),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ÍTENS',
                      style: AppTheme.textStyles.eventDetailsTitle,
                    ),
                    SizedBox(height: 8),
                    Divider(
                      thickness: 1,
                      indent: 0,
                      height: 1,
                    ),
                    SizedBox(height: 10),
                    ...event.items
                        .map(
                          (e) => ItemTileWidget(
                            name: e.name,
                            value: e.value,
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
            Container(
              color: Color(0xFF455250).withOpacity(.08),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ItemTileWidget(
                  name: 'Total',
                  value: event.value,
                  hasDivider: false,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (event.remainingValue != 0.0)
                    Text(
                      'Faltam ${event.remainingValue.reais()}',
                      style: AppTheme.textStyles.eventDetailsTitle
                          .copyWith(color: Color(0xFFE83F5B)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
