import 'package:splitit/modules/home/models/dashboard_model.dart';
import 'package:splitit/shared/models/event_model.dart';

abstract class HomeRepository {
  Future<List<EventModel>> getEvents();
  Future<DashboardModel> getDashboard();
}
