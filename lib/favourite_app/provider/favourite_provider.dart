import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/favourite_app/model/items.dart';
import 'package:riverstate/favourite_app/provider/favourite_states.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteStates>((ref) {
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteStates> {
  FavouriteNotifier()
      : super(FavouriteStates(allItems: [], favouriteItems: [], search: ''));

  void addItems() {
    List<Itemss> item = [
      Itemss(name: 'Macbook', id: 1, favourite: true),
      Itemss(name: 'iPhone', id: 2, favourite: false),
      Itemss(name: 'G-force 3060', id: 3, favourite: false),
      Itemss(name: 'Samsung Ultra', id: 4, favourite: true),
      Itemss(name: 'Google Pixes 9', id: 5, favourite: false),
      Itemss(name: 'iPad Pro 13', id: 6, favourite: true)
    ];
    state =
        state.copyWith(allItems: item.toList(), favouriteItems: item.toList());
  }

  void filterList(String search) {
    state =
        state.copyWith(favouriteItems: _filterItems(state.allItems, search));
  }

  void favourite(String option) {
    state =
        state.copyWith(favouriteItems: _favouriteItems(state.allItems, option));
  }

  List<Itemss> _favouriteItems(List<Itemss> items, String option) {
    if (option == 'All') {
      return items;
    }
    return items.where((item) => item.favourite == true).toList();
  }

  List<Itemss> _filterItems(List<Itemss> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
