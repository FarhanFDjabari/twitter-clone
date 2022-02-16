import 'package:equatable/equatable.dart';

class Tweet extends Equatable {
  final int id;
  final int userId;
  final String name;
  final String handle;
  final String? content;
  final int? repliedTo;
  final DateTime createdAt;

  const Tweet({
    required this.id,
    required this.userId,
    required this.name,
    required this.handle,
    required this.content,
    required this.repliedTo,
    required this.createdAt,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      id: json['id'] as int,
      userId: json['user_id'],
      name: json['name'],
      handle: json['handle'],
      content: json['content'],
      repliedTo: json['replied_to'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
    );
  }

  @override
  List<Object?> get props => [id, userId, content, repliedTo, createdAt];
}
