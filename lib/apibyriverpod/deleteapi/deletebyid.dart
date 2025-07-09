import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/apibyriverpod/getapi/futureprovider.dart';

class DeleteById extends ConsumerStatefulWidget {
  const DeleteById({super.key});

  @override
  ConsumerState<DeleteById> createState() => _DeleteByIdState();
}

class _DeleteByIdState extends ConsumerState<DeleteById> {
  final TextEditingController _deleteContrller = TextEditingController();
  Future<void> _deletePost() async {
    try {
      final apiService = ref.read(apiServicesProvider);
      await apiService.deleteDataByIde(_deleteContrller.text.toString());
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _deleteContrller,
              decoration: InputDecoration(hintText: 'inter Ide'),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _deletePost();
                  });
                },
                child: Text('Delete'))
          ],
        ),
      ),
    );
  }
}
