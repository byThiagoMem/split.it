import 'package:mobx/mobx.dart';

import 'package:splitit/shared/models/event_model.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/models/item_model.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';

import 'create_split_status.dart';
export 'create_split_status.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  final FirebaseRepository repository;

  _CreateSplitControllerBase({
    required this.repository,
  });

  @observable
  int currentPage = 0;

  @observable
  EventModel event = EventModel();

  @observable
  CreateSplitStatus status = CreateSplitStatus.empty;

  @action
  Future<void> saveEvent() async {
    try {
      status = CreateSplitStatus.loading;
      ;
      final response = await repository.create(event);
      print(response);
      status = CreateSplitStatus.success;
      ;
      nextPage();
    } catch (e) {
      status = CreateSplitStatus.error;
      ;
    }
  }

  @action
  void nextPage() {
    if (currentPage < 2) {
      currentPage++;
    }
  }

  @action
  void backPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @action
  void onChanged(
      {String? name, List<ItemModel>? items, List<FriendModel>? friends}) {
    event = event.copyWith(name: name, items: items, friends: friends);
  }

  @computed
  bool get enableNavigateButton {
    if (event.name.isNotEmpty && currentPage == 0) {
      return true;
    } else if (event.friends.isNotEmpty && currentPage == 1) {
      return true;
    } else if (event.items.isNotEmpty && currentPage == 2) {
      return true;
    }
    return false;
  }
}
