import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twettir/common/cache.dart';
import 'package:twettir/models/TweetDetailData.dart';
import '../models/Tweet.dart';
import '../common/constants.dart';

class TweetService {
  Future<String> getToken() async {
    final cache = await Cache.getData('user_data');
    return cache['token'];
  }

  Future<bool> postTweet(String content) async {
    final token = await getToken();

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

  Future<bool> postReplyTweet(int id, String content) async {
    final token = await getToken();

    final response = await http.post(
      Uri.parse('$BASE_URL/tweet'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'content': content,
        'replied_to': id,
      }),
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

  Future<TweetDetailData?> getTweetById(int id) async {
    final response = await http.get(Uri.parse('$BASE_URL/tweet/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        return TweetDetailData.fromJson(data['data']);
      }
    } else {
      throw Exception('Failed');
    }
  }

  Future<bool> deleteTweet(int id) async {
    final response = await http.delete(Uri.parse('$BASE_URL/tweet/$id'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        return true;
      }
    }
    return false;
  }

  Future<bool> updateTweet(int id, String content) async {
    final token = await getToken();

    final response = await http.post(
      Uri.parse('$BASE_URL/tweet/$id'),
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
}
