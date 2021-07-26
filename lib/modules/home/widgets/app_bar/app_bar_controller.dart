import 'package:splitit/modules/home/repositories/home_repository.dart';
import 'package:splitit/modules/home/repositories/home_repository_mock.dart';
import 'package:splitit/modules/home/widgets/app_bar/app_bar_state.dart';

class AppBarController {
  late HomeRepository repository;
  Function(AppBarState state)? onListen;

  AppBarState state = AppBarStateEmpty();

  AppBarController({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  getDashboard() async {
    update(AppBarStateLoading());
    try {
      final response = await repository.getDashboard();
      update(AppBarStateSuccess(dashboard: response));
    } catch (e) {
      update(AppBarStateFailure(message: e.toString()));
    }
  }

  void update(AppBarState state) {
    this.state = state;
    if (onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(AppBarState state) onChange) {
    onListen = onChange;
  }
}
