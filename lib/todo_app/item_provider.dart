import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/todo_app/items.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItems(String name) {
    final item = Item(name: name, id: DateTime.now().toString());
    state.add(item);
    state = state.toList();
  }

  void deleteItems(
    String id,
  ) {
    state.removeWhere((item) => item.id == id);
    state = state.toList();
  }

  void updateItems(String id, String name) {
    int foundIndex = state.indexWhere((item) => item.id == id);
    state[foundIndex].name = name;
    state = state.toList();
  }
}
