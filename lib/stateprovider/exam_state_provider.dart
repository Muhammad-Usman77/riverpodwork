import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref) {
  return false;
});

class ExamStateProvider extends ConsumerWidget {
  const ExamStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer(builder: (constext, ref, child) {
            final count = ref.watch(counter);
            return Text(
              count.toString(),
              style: TextStyle(fontSize: 25),
            );
          }),
          Consumer(builder: (constext, ref, child) {
            final change = ref.watch(switchProvider);
            print('build-3');

            return Switch(
                value: change,
                onChanged: (value) {
                  ref.read(switchProvider.notifier).state = value;
                });
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                  child: Text("+")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state--;
                  },
                  child: Text("-")),
            ],
          )
        ],
      ),
    );
  }
}
