import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/todo_app/item_provider.dart';

class TodoAppScreen extends ConsumerWidget {
  const TodoAppScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(item[index].name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        ref
                            .read(itemProvider.notifier)
                            .updateItems(item[index].id, 'updated');
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        ref
                            .read(itemProvider.notifier)
                            .deleteItems(item[index].id);
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItems('usman');
        },
        child: Text("Add"),
      ),
    );
  }
}
