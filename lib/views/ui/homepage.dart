import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../models/Tweet.dart';
import '../../app_color.dart';
import '../../presenter/cubit/tweet_cubit.dart';
import '../../views/widgets/tweet_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<TweetCubit>().getTweets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<TweetCubit>().getTweets();
        },
        child: BlocBuilder<TweetCubit, TweetState>(builder: (context, state) {
          if (state is TweetLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TweetLoaded) {
            final List<Tweet> tweets = state.tweets;
            return ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 0.5,
                  color: twitGrey.withOpacity(0.75),
                );
              },
              itemCount: tweets.length,
              itemBuilder: (listViewCtx, index) {
                return TweetTile(
                  tweetId: tweets[index].id,
                  userId: tweets[index].userId.toString(),
                  username: 'Username',
                  postTime: timeago.format(tweets[index].createdAt),
                  content: '''${tweets[index].content}''',
                );
              },
            );
          } else if (state is TweetFailed) {
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Center(
                child: Text(state.message),
              ),
            );
          }
          return SizedBox();
        }),
      ),
    );
  }
}
