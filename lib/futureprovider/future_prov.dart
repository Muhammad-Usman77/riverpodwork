import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<List<String>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return ['usman','ali', 'moawya', 'jamal'];
});
