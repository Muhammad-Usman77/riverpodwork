import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/multi_state_provider/multistate.dart';

class MultiStateProvider extends ConsumerWidget {
  const MultiStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build-1");
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi State Provider"),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            print('build-container-eye');
            final slider =
                ref.watch(sliderProvider.select((state) => state.passWord));
            return InkWell(
              onTap: () {
                final stateProvider = ref.read(sliderProvider.notifier);
                stateProvider.state =
                    stateProvider.state.copyWith(passWord: !slider);
              },
              child: Container(
                height: 150,
                width: 150,
                child: slider ? Icon(Icons.remove_red_eye) : Icon(Icons.image),
              ),
            );
          }
          )
          ,
          Consumer(builder: (context, ref, child) {
            print('build-container-slider');
            final slider = ref.watch(sliderProvider.select((state) => state.slider));
            return Container(
              height: 150,
              width: 150,
              color: Colors.red.withOpacity(slider),
            );
          }),
          Consumer(builder: (context, ref, child) {
            print('build-slider');

            final slider =
                ref.watch(sliderProvider.select((state) => state.slider));
            return Slider(
                value: slider,
                onChanged: (value) {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state =
                      stateProvider.state.copyWith(slider: value);
                  // final slider = ref
                  //     .read(sliderProvider.notifier)
                  //     .state
                  //     .copyWith(slider: value);
                });
          }),
        ],
      ),
    );
  }
}
