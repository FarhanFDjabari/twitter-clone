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
