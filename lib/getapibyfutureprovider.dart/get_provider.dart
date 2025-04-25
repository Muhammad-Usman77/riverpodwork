import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final getProvider = FutureProvider<List<PostModel>>((ref) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  try {
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<PostModel> postList =
          data.map((item) => PostModel.fromJson(item)).toList();
      return postList;
    } else {
      throw "something went wrong";
    }
  } on SocketException {
    throw 'no internet';
  } catch (e) {
    rethrow;
  }
});

class PostModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  PostModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['body']);
  }
}
