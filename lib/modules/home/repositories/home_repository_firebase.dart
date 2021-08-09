import 'package:splitit/modules/home/models/dashboard_model.dart';
import 'package:splitit/modules/home/repositories/home_repository.dart';
import 'package:splitit/shared/models/event_model.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';

class HomeRepositoryFirebase implements HomeRepository {
  final client = FirebaseRepository();
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
    try {
      final response = await client.get("/events");
      final events = response.map((e) => EventModel.fromMap(e)).toList();
      return events;
    } catch (e) {
      return [];
    }
  }
}
