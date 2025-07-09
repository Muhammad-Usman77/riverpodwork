import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverstate/apibyriverpod/getapi/futureprovider.dart';

class PutDataScreen extends ConsumerStatefulWidget {
  const PutDataScreen({super.key});

  @override
  ConsumerState<PutDataScreen> createState() => _PutDataScreenState();
}

class _PutDataScreenState extends ConsumerState<PutDataScreen> {
  Future<void> _putData() async {
    try {
      final apiService = ref.read(apiServicesProvider);
      await apiService.putUserData({
        'name': 'Usman & Faraz',
        'email': 'faraz@gmail.com',
        "title": "this is update data by river pod"
      }, '686e730de619f603e8ddf855');
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
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _putData();
                });
              },
              child: Text('UpdateData'),
            ),
          ],
        ),
      ),
    );
  }
}
