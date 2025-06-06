import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<double>((ref) async* {
  final randowm = Random();
  double currentPrice = 100.0;

  while (true) {
    await Future.delayed(Duration(seconds: 1));

    currentPrice += randowm.nextDouble() * 4 - 2;

    yield double.parse(currentPrice.toStringAsFixed(2));
  }
});
