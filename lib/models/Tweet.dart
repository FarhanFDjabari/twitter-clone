import 'Reply.dart';

class Tweet {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;
  final List<Reply> replies;

  const Tweet({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.replies,
  });
}

abstract class TweetRepository {
  Future<List<Tweet>> getTweets();
}

class TweetRepositoryImpl implements TweetRepository {
  @override
  Future<List<Tweet>> getTweets() {
    // TODO: implement getTweets
    throw UnimplementedError();
  }
}
