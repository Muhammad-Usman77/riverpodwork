import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/apibyriverpod/getapi/futureprovider.dart';

class GetApiScreen extends ConsumerWidget {
  const GetApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(usersDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Users'),
      ),
      body: userAsync.when(
          data: (users) {
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index]['name']),
                    subtitle: Text(users[index]['_id'].toString()),
                  );
                });
          },
          error: (error, stack) => Text('error: $error '),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
