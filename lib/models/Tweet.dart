import 'Reply.dart';

class Tweet {
  final int id;
  final int userId;
  final String content;
  final int? repliedTo;
  final DateTime createdAt;

  const Tweet({
    required this.id,
    required this.userId,
    required this.content,
    required this.repliedTo,
    required this.createdAt,
  });

  Tweet.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        userId = json['user_id'] as int,
        content = json['content'],
        repliedTo = json['replied_to'] as int?,
        createdAt =
            DateTime.fromMillisecondsSinceEpoch(json['created_at'] as int);
}
