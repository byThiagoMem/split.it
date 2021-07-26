import 'package:flutter/material.dart';
import 'package:splitit/modules/home/widgets/icon_dollar.dart';
import 'package:splitit/modules/home/widgets/loading_widget.dart';
import 'package:splitit/shared/models/event_model.dart';
import 'package:splitit/shared/utils/custom_date_format.dart';
import 'package:splitit/theme/app_theme.dart';

class EventTile extends StatelessWidget {
  final EventModel model;
  final bool isLoading;

  const EventTile({Key? key, required this.model, this.isLoading = false})
      : super(key: key);

  IconDollarType get type =>
      model.value! >= 0 ? IconDollarType.positive : IconDollarType.negative;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              LoadingWidget(size: Size(48, 48)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: LoadingWidget(size: Size(52, 18)),
                        subtitle: LoadingWidget(size: Size(52, 18)),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LoadingWidget(size: Size(61, 17)),
                            SizedBox(height: 5),
                            LoadingWidget(size: Size(44, 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            IconDollar(type: type),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(model.title!,
                          style: AppTheme.textStyles.eventTileTitle),
                      subtitle: Text(
                          ' ${model.created!.day < 10 ? 0 : ''}${model.created!.day} ${CustomDateFormat.customFormatDate(month: model.created!.month)}'
                              .toString(),
                          style: AppTheme.textStyles.eventTilesubtitle),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'R\$ ${model.value!.toStringAsFixed(2).replaceFirst('-', '').replaceAll('.', ',')}',
                            style: AppTheme.textStyles.eventTileMoney,
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${model.people} pessoa${model.people! <= 1 ? '' : 's'}',
                            style: AppTheme.textStyles.eventTilePeople,
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppTheme.colors.divider),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
