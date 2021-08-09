import 'package:splitit/modules/home/models/dashboard_model.dart';
import 'package:splitit/modules/home/repositories/home_repository.dart';
import 'package:splitit/shared/models/event_model.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<DashboardModel> getDashboard() async {
    await Future.delayed(Duration(seconds: 2));
    return DashboardModel(
      send: 124,
      receive: 48,
    );
  }

  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      EventModel(name: 'Churrasco', created: DateTime(2021, 3, 1), value: 32),
      EventModel(
          name: 'Aniversário', created: DateTime(2021, 3, 24), value: -15),
      EventModel(name: 'Almoço', created: DateTime(2021, 4, 7), value: 42),
      EventModel(name: 'Jantar', created: DateTime.now(), value: -10),
      EventModel(name: 'Churrasco', created: DateTime.now(), value: 32),
      EventModel(name: 'Churrasco', created: DateTime.now(), value: 32),
      EventModel(name: 'Churrasco', created: DateTime.now(), value: 32)
    ];
  }
}
