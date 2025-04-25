import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/favourite_app/provider/favourite_provider.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(onSelected: (value) {
            ref.read(favouriteProvider.notifier).favourite(value);
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(value: 'All', child: Text('All')),
              PopupMenuItem(value: 'Favourite', child: Text('Favourte')),
            ];
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Using Riverpod',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(favouriteProvider.notifier).filterList(value);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: favourteList.favouriteItems.length,
                    itemBuilder: (context, index) {
                      final item = favourteList.favouriteItems[index];

                      return ListTile(
                        title: Text(item.name),
                        trailing: Icon(item.favourite
                            ? Icons.favorite
                            : Icons.favorite_outline),
                      );
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItems();
        },
        child: Text("Add"),
      ),
    );
  }
}
