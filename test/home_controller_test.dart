import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:splitit/modules/home/home_controller.dart';
import 'package:splitit/modules/home/home_state.dart';
import 'package:splitit/modules/home/repositories/home_repository.dart';
import 'package:splitit/shared/models/event_model.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeController controller;
  late HomeRepository repository;

  setUp(() {
    repository = HomeRepositoryMock();
    controller = HomeController(repository: repository);
  });

  test("Testando o getEvents Sucesso", () async {
    expect(controller.state, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(repository.getEvents).thenAnswer((_) async =>
        [EventModel(name: "name", created: DateTime.now(), value: 34)]);

    await controller.getEvents();
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateLoading>());
    expect(states[2], isInstanceOf<HomeStateSuccess>());
    expect(states.length, 3);
  });

  test("Testando o getEvents Failure", () async {
    expect(controller.state, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];

    mobx.autorun((_) {
      states.add(controller.state);
    });

    when(repository.getEvents).thenThrow('Deu erro');
    await controller.getEvents();
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateLoading>());
    expect(states[2], isInstanceOf<HomeStateFailure>());
    expect((states[2] as HomeStateFailure).message, "Deu erro");
    expect(states.length, 3);
  });
}
