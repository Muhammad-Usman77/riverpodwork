import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return "Riverpod for constant values";
});

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sub = ref.watch(hello);
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Provider Riverpod"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          sub,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
