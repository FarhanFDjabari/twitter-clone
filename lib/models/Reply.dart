class Reply {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;

  const Reply({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
  });
}
