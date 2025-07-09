import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = StateProvider((ref) {
  int a = 5;
  int b = 5;
  int c = a + b;
  return 0;
});
final swt = StateProvider((ref) {
  return false;
});
final addProvider = StateProvider<List<int>>((ref) {
  return [44, 2, 3, 4, 5];
});

class SimpleProiderScreen extends ConsumerWidget {
  const SimpleProiderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final hi = ref.watch(hello);
    final add = ref.watch(addProvider);

    print('build in functon');
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: add.length,
                      itemBuilder: (context, index) {
                        return Text(add[index].toString());
                      })),
              Consumer(builder: (context, ref, child) {
                print('build 1 by consumer');
                var hi = ref.watch(hello);
                return Text(hi.toString());
              }),
              Consumer(builder: (context, ref, child) {
                print('build by bool value');
                var ss = ref.watch(swt);
                return Switch(
                    value: ss,
                    onChanged: (value) {
                      ref.read(swt.notifier).state = value;
                    });
              }),
              ElevatedButton(
                  onPressed: () {
                    ref.read(hello.notifier).state++;
                  },
                  child: Text("+")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(hello.notifier).state--;
                  },
                  child: Text("-")),
            ],
          ),
        ),
      ),
    );
  }
}
