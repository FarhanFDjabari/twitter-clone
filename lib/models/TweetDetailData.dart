import 'package:equatable/equatable.dart';
import 'package:twettir/models/Tweet.dart';
import 'package:twettir/models/User.dart';

class TweetDetailData extends Equatable {
  final int id;
  final int userId;
  final String? content;
  final int? repliedTo;
  final DateTime createdAt;
  final List<Tweet>? replies;
  final User user;

  const TweetDetailData(
      {required this.id,
      required this.userId,
      required this.content,
      required this.repliedTo,
      required this.createdAt,
      required this.replies,
      required this.user});

  factory TweetDetailData.fromJson(Map<String, dynamic> json) {
    return TweetDetailData(
      id: json['tweet']['id'] as int,
      userId: json['tweet']['user_id'] as int,
      content: json['tweet']['content'],
      repliedTo: json['tweet']['replied_to'] as int?,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          json['tweet']['created_at'] as int),
      replies: json['replies'] != null
          ? List<Tweet>.from(
              json["replies"].map((reply) => Tweet.fromJson(reply)),
            )
          : null,
      user: User.fromJson(json['user']),
    );
  }

  @override
  List<Object?> get props =>
      [id, userId, content, repliedTo, createdAt, replies, user];
}
