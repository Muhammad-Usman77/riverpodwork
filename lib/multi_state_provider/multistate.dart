import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(slider: .5, passWord: false);
});

class AppState {
  final double slider;
  final bool passWord;

  AppState({ required this.slider, required this.passWord});

  AppState copyWith({
    double? slider,
    bool? passWord,
  }){
    return AppState(slider: slider ?? this.slider, passWord: passWord ?? this.passWord);
  }
}
