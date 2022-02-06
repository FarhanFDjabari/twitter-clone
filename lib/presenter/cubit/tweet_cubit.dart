import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:twettir/models/TweetDetailData.dart';
import '../../services/tweet_service.dart';
import '../../models/Tweet.dart';

part 'tweet_state.dart';

class TweetCubit extends Cubit<TweetState> {
  final TweetService service;

  TweetCubit(this.service) : super(TweetInitial());

  void getTweets() async {
    emit(TweetLoading());
    try {
      List<Tweet> result = await service.getTweets();
      result = result.where((element) => element.repliedTo == null).toList();
      emit(TweetLoaded(result));
    } catch (e) {
      emit(TweetFailed(e.toString()));
    }
  }

  void getTweetById(int id) async {
    emit(GetTweetByIdLoading());
    try {
      final result = await service.getTweetById(id);
      if (result != null) {
        emit(GetTweetByIdSuccess(result));
      } else {
        emit(GetTweetByIdFailed('Failed'));
      }
    } catch (e) {
      emit(GetTweetByIdFailed(e.toString()));
    }
  }

  void postTweet(String content) async {
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

  void postReplyTweet(int id, String content) async {
    emit(PostTweetLoading());
    try {
      final result = await service.postReplyTweet(id, content);
      if (result == true) {
        emit(PostTweetSuccess());
      } else {
        emit(PostTweetFailed('Failed to post tweet'));
      }
    } catch (e) {
      emit(PostTweetFailed(e.toString()));
    }
  }

  void deleteTweet(int id) async {
    emit(DeleteTweetLoading());
    try {
      final result = await service.deleteTweet(id);
      if (result == true) {
        emit(DeleteTweetSuccess());
      } else {
        emit(DeleteTweetFailed('Failed to delete tweet'));
      }
    } catch (e) {
      emit(DeleteTweetFailed(e.toString()));
    }
  }

  void updateTweet(int id, String content) async {
    emit(UpdateTweetLoading());
    try {
      final result = await service.updateTweet(id, content);
      if (result == true) {
        emit(UpdateTweetSuccess());
      } else {
        emit(UpdateTweetFailed('Failed to Update tweet'));
      }
    } catch (e) {
      emit(UpdateTweetFailed(e.toString()));
    }
  }
}
