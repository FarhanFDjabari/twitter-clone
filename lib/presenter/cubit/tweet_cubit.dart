import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../services/tweet_service.dart';
import '../../models/Tweet.dart';

part 'tweet_state.dart';

class TweetCubit extends Cubit<TweetState> {
  final TweetService service;

  TweetCubit(this.service) : super(TweetInitial());

  void getTweets() async {
    emit(TweetLoading());
    try {
      final result = await service.getTweets();
      emit(TweetLoaded(result));
    } catch (e) {
      emit(TweetFailed(e.toString()));
    }
  }

  void postTweets(String content) async {
    emit(PostTweetLoading());
    try {
      final result = await service.postTweet(content);
      if (result == true) {
        emit(PostTweetSuccess());
      } else {
        emit(PostTweetFailed('Failed to post tweet'));
      }
    } catch (e) {
      emit(PostTweetFailed(e.toString()));
    }
  }
}
