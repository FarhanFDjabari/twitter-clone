import 'dart:convert';

import 'package:http/http.dart' as http;
import '../common/cache.dart';

const BASE_URL =
    'http://ec2-18-138-35-61.ap-southeast-1.compute.amazonaws.com:8080';

class User {
  final String email;
  final String password;
  final String name;
  final String username;
  final String? token;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.username,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['email'],
        name = json['name'],
        username = json['handle'],
        token = json['token'];
}

class UserRepository {
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$BASE_URL/user/login'),
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await Cache.writeData(
        key: 'user_data',
        value: {
          'email': email,
          'token': data['token'],
        },
      );
      return "Success";
    } else {
      throw Exception("Failed");
    }
  }

  Future<String> register({
    required String email,
    required String password,
    required String name,
    required String username,
  }) async {
    final response = await http.post(
      Uri.parse('$BASE_URL/user/register'),
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
        "name": name,
        "handle": username
      }),
    );

    if (response.statusCode == 200) {
      return "Success";
    } else {
      throw Exception("Failed");
    }
  }
}
