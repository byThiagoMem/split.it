import 'package:mobx/mobx.dart';
import 'package:splitit/shared/models/item_model.dart';

part 'step_three_controller.g.dart';

class StepThreeController = _StepThreeControllerBase with _$StepThreeController;

abstract class _StepThreeControllerBase with Store {
  @observable
  ObservableList<ItemModel> items = ObservableList.of([]);

  @observable
  ItemModel item = ItemModel();

  @action
  void addItem() {
    items.add(item);
    item = ItemModel();
  }

  @action
  void removeItem(int index) {
    items.removeAt(index);
  }

  @action
  void onChanged({String? name, double? value}) {
    item = item.copyWith(name: name, value: value);
  }

  void editingItem(int index, {String? name, double? value}) {
    items[index] = items[index].copyWith(name: name, value: value);
  }

  @computed
  int get currentIndex => items.length + 1;

  @computed
  bool get showButton => item.name.isNotEmpty && item.value > 0;
}
