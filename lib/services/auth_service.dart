import 'dart:convert';

import 'package:http/http.dart' as http;
import '../common/cache.dart';

const BASE_URL =
    'http://ec2-18-138-35-61.ap-southeast-1.compute.amazonaws.com:8080';

class AuthService {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$BASE_URL/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        await Cache.writeData(
          key: 'user_data',
          value: {
            'email': email,
            'token': data['token'],
          },
        );
        return true;
      }
      return false;
    } else {
      throw Exception("Failed");
    }
  }

  Future<bool> register({
    required String email,
    required String password,
    required String name,
    required String username,
  }) async {
    final response = await http.post(
      Uri.parse('$BASE_URL/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
        "name": name,
        "handle": username
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        return true;
      }
      return false;
    } else {
      throw Exception("Failed");
    }
  }
}
