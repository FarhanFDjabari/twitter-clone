import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/Tweet.dart';
import '../common/constants.dart';

class TweetService {
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
