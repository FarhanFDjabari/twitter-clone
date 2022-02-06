part of 'tweet_cubit.dart';

@immutable
abstract class TweetState extends Equatable {}

class TweetInitial extends TweetState {
  @override
  List<Object?> get props => [];
}

class TweetLoading extends TweetState {
  @override
  List<Object?> get props => [];
}

class TweetLoaded extends TweetState {
  final List<Tweet> tweets;

  TweetLoaded(this.tweets);

  @override
  List<Object?> get props => [tweets];
}

class TweetFailed extends TweetState {
  final String message;

  TweetFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class PostTweetLoading extends TweetState {
  @override
  List<Object?> get props => [];
}

class PostTweetSuccess extends TweetState {
  @override
  List<Object?> get props => [];
}

class PostTweetFailed extends TweetState {
  final String message;

  PostTweetFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class UpdateTweetLoading extends TweetState {
  @override
  List<Object?> get props => [];
}

class UpdateTweetSuccess extends TweetState {
  @override
  List<Object?> get props => [];
}

class UpdateTweetFailed extends TweetState {
  final String message;

  UpdateTweetFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class DeleteTweetLoading extends TweetState {
  @override
  List<Object?> get props => [];
}

class DeleteTweetSuccess extends TweetState {
  @override
  List<Object?> get props => [];
}

class DeleteTweetFailed extends TweetState {
  final String message;

  DeleteTweetFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class GetTweetByIdLoading extends TweetState {
  @override
  List<Object?> get props => [];
}

class GetTweetByIdSuccess extends TweetState {
  final TweetDetailData tweet;

  GetTweetByIdSuccess(this.tweet);

  @override
  List<Object?> get props => [tweet];
}

class GetTweetByIdFailed extends TweetState {
  final String message;

  GetTweetByIdFailed(this.message);

  @override
  List<Object?> get props => [message];
}
