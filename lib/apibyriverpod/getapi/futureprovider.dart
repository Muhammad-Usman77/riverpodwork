import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

// this provider for apiservices and get class in provider
final apiServicesProvider = Provider<ApiService>((ref) => ApiService());

//this future provider use for get users data
// and we read the apiserves provder in this provider
final usersDataProvider = FutureProvider<List<dynamic>>((ref) async {
  final apiSr = ref.read(apiServicesProvider);
  return apiSr.getApiUsers();
});

class ApiService {
  Future<List<dynamic>> getApiUsers() async {
    var url = 'https://crudcrud.com/api/d3cebc709c634288a2a217fde83c0a5a/unicorn';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  // Add this to your ApiService class
Future<void> postUserData(Map<String, dynamic> userData) async {
  var url = 'https://crudcrud.com/api/d3cebc709c634288a2a217fde83c0a5a/unicorn';
  var uri = Uri.parse(url);
  var response = await http.post(
    uri,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(userData),
  );
  
  if (response.statusCode != 201) {
    throw Exception('Failed to post data');
  }
}
}
