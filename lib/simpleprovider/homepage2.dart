import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider((ref) {
  return "riverpod for stateful";
});

class Homepage2 extends ConsumerStatefulWidget {
  const Homepage2({super.key});

  @override
  ConsumerState<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends ConsumerState<Homepage2> {
  @override
  Widget build(BuildContext context) {
    final ts = ref.watch(hello);
    return Scaffold(
      body: Center(
        child: Text(ts),
      ),
    );
  }
}
