import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/getapibyfutureprovider.dart/get_provider.dart';

class GetScreen extends ConsumerWidget {
  const GetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(getProvider);
    return Scaffold(
      body: Center(
        child: postList.when(
          skipLoadingOnRefresh: true,
            data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.body),
                    ),
                  );
                }),
            error: (error, stack) => TextButton(
                onPressed: () {
                  ref.invalidate(getProvider);
                },
                child: Text(error.toString())),
            loading: () => CircularProgressIndicator()),
      ),
    );
  }
}
