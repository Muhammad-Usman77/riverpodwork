import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:riverstate/apibyriverpod/getapi/futureprovider.dart';

class PostApiScreen extends ConsumerStatefulWidget {
  const PostApiScreen({super.key});

  @override
  ConsumerState<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends ConsumerState<PostApiScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  Future<void> _submitForm() async {
    try {
      final apiService = ref.read(apiServicesProvider);
      await apiService.postUserData({
        'name': _nameController.text,
        'email': _titleController.text,
      });
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
              controller: _nameController,
              decoration: InputDecoration(hintText: 'name'),
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'title'),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _submitForm();
                  });
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
