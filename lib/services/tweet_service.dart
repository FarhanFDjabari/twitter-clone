import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twettir/common/cache.dart';
import '../models/Tweet.dart';
import '../common/constants.dart';

class TweetService {
  Future<bool> postTweet(String content) async {
    final cache = await Cache.getData('user_data');
    final token = cache['token'];

    final response = await http.post(
      Uri.parse('$BASE_URL/tweet'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'content': content}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        return true;
      }
    }
    return false;
  }

  Future<List<Tweet>> getTweets() async {
    final response = await http.get(Uri.parse('$BASE_URL/tweet'));
    List<Tweet> tweets = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        tweets = (data['data'] as List<dynamic>)
            .map((e) => Tweet.fromJson(e))
            .toList();
      }
    }
    return tweets;
  }
}
