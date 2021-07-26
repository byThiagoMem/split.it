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
      EventModel(
          title: 'Churrasco', created: DateTime.now(), value: 32, people: 1),
      EventModel(
          title: 'Aniversário', created: DateTime.now(), value: -15, people: 1),
      EventModel(
          title: 'Almoço', created: DateTime.now(), value: 42, people: 1),
      EventModel(
          title: 'Jantar', created: DateTime.now(), value: -10, people: 1),
      EventModel(
          title: 'Churrasco', created: DateTime.now(), value: 32, people: 1),
      EventModel(
          title: 'Churrasco', created: DateTime.now(), value: 32, people: 1),
      EventModel(
          title: 'Churrasco', created: DateTime.now(), value: 32, people: 1)
    ];
  }
}
