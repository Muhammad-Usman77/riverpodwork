import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/futureprovider/future_prov.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      body: Center(
        child: provider.when(
            skipLoadingOnRefresh: false,
            data: (value) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Text(value[index].toString());
                }),
            error: (error, Stack) => Text(error.toString()),
            loading: () => CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(futureProvider);
        },
        child: Text("Refresh"),
      ),
    );
  }
}
