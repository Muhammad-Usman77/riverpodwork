import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/state_notifier_provider/searchnofitier.dart';

class HomeSNF extends ConsumerWidget {
  const HomeSNF({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print('search widget');
              final search = ref.watch(searchProvider.select((state)=> state.search));

              return Text(search);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print('switch widget');
              final search = ref.watch(searchProvider.select((state)=> state.isChange));

              return Switch(
                  value: search,
                  onChanged: (value) {
                    ref.read(searchProvider.notifier).onChange(value);
                  });
            },
          ),
        ],
      ),
    );
  }
}
