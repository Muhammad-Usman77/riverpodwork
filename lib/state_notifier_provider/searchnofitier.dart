import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchProvider, searchState>((ref) {
  return SearchProvider();
});

class SearchProvider extends StateNotifier<searchState> {
  SearchProvider() : super(searchState(search: '',isChange: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }
   void onChange(bool isChange) {
    state = state.copyWith(isChange: isChange);
  }
}

class searchState {
  final String search;
  final bool isChange;

  searchState({required this.search, required this.isChange});

  searchState copyWith({String? search, bool? isChange}) {
    return searchState(
      search: search ?? this.search,
      isChange: isChange?? this.isChange
      );
  }
}
