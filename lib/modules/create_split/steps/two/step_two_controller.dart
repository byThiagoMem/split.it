import 'package:mobx/mobx.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';

import '../../create_split_controller.dart';
part 'step_two_controller.g.dart';

class StepTwoController = _StepTwoControllerBase with _$StepTwoController;

abstract class _StepTwoControllerBase with Store {
  final CreateSplitController controller;
  final repository = FirebaseRepository();
  late ReactionDisposer _disposer;

  _StepTwoControllerBase({required this.controller}) {
    _disposer = autorun(
      (_) => {
        controller.onChanged(friends: _selectedFriends),
      },
    );
  }

  @observable
  List<FriendModel> _friends = [];

  @observable
  ObservableList<FriendModel> _selectedFriends = ObservableList.of([]);

  List<FriendModel> get selectedFriends => _selectedFriends;

  @observable
  String search = '';

  @action
  void onChange(String value) {
    search = value;
  }

  @action
  void addFriend(FriendModel friend) {
    _selectedFriends.add(friend);
  }

  @action
  void removeFriend(FriendModel friend) {
    _selectedFriends.remove(friend);
  }

  @computed
  List<FriendModel> get items {
    if (_selectedFriends.isNotEmpty) {
      final filteresList = _friends.where((element) {
        final contains = element.name
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase());
        final notAdd = !_selectedFriends.contains(element);
        return contains && notAdd;
      }).toList();
      return filteresList;
    }

    if (search.isEmpty) {
      return _friends;
    } else {
      final filteresList = _friends
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
      return filteresList;
    }
  }

  @action
  Future<void> getFriends() async {
    final response = await this.repository.get('/friends');
    _friends = response.map((e) => FriendModel.fromMap(e)).toList();
  }

  void disposer() {
    _disposer;
  }
}
