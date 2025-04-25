import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/futureprovider/future_prov.dart';
import 'package:riverstate/streamprovider/stream_provider.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Consumer(builder: (context, ref, child) {
      final strProvider = ref.watch(streamProvider);

      return Center(
        child: strProvider.when(
            skipLoadingOnRefresh: false,
            data: (price) => Text(price.toStringAsFixed(2)),
            error: (error, stack) => TextButton(
                onPressed: () {
                  ref.invalidate(futureProvider);
                },
                child: Text('error:$error')),
            loading: () => CircularProgressIndicator()),
      );
    }));
  }
}
