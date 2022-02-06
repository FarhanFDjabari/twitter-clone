part of 'tweet_cubit.dart';

@immutable
abstract class TweetState {}

class TweetInitial extends TweetState {}

class TweetLoading extends TweetState {}

class TweetLoaded extends TweetState {
  final List<Tweet> tweets;

  TweetLoaded(this.tweets);
}

class TweetFailed extends TweetState {
  final String message;

  TweetFailed(this.message);
}

class PostTweetLoading extends TweetState {}

class PostTweetSuccess extends TweetState {}

class PostTweetFailed extends TweetState {
  final String message;

  PostTweetFailed(this.message);
}

class UpdateTweetLoading extends TweetState {}

class UpdateTweetSuccess extends TweetState {}

class UpdateTweetFailed extends TweetState {
  final String message;

  UpdateTweetFailed(this.message);
}

class DeleteTweetLoading extends TweetState {}

class DeleteTweetSuccess extends TweetState {}

class DeleteTweetFailed extends TweetState {
  final String message;

  DeleteTweetFailed(this.message);
}
