import 'package:mobx/mobx.dart';
import 'package:splitit/modules/home/home_state.dart';
import 'package:splitit/modules/home/repositories/home_repository.dart';
import 'package:splitit/modules/home/repositories/home_repository_mock.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late HomeRepository repository;

  @observable
  HomeState state = HomeStateEmpty();

  _HomeControllerBase({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  getEvents() async {
    state = HomeStateLoading();
    try {
      final response = await repository.getEvents();
      state = HomeStateSuccess(events: response);
    } catch (e) {
      state = HomeStateFailure(message: e.toString());
    }
  }
}
