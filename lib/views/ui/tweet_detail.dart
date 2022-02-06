import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twettir/presenter/cubit/tweet_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twettir/views/widgets/reply_tile.dart';

import '../../app_color.dart';
import 'edit_page.dart';

class TweetDetail extends StatefulWidget {
  const TweetDetail({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  _TweetDetailState createState() => _TweetDetailState();
}

class _TweetDetailState extends State<TweetDetail> {
  final _replyInputController = TextEditingController();
  bool isValid = false;

  @override
  void initState() {
    context.read<TweetCubit>().getTweetById(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    _replyInputController.dispose();
    super.dispose();
  }

  inputCheck() {
    if (_replyInputController.text.isNotEmpty) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: twitWhite,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: twitWhite,
        title: Text(
          'Tweet',
          style: TextStyle(
            color: twitBlack,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<TweetCubit>().getTweets();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: twitBlack,
          ),
        ),
      ),
      body: BlocBuilder<TweetCubit, TweetState>(builder: (context, state) {
        if (state is GetTweetByIdLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetTweetByIdFailed) {
          return Center(child: Text(state.message));
        } else if (state is GetTweetByIdSuccess) {
          final tweet = state.tweet;
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: deviceHeight,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 26,
                                        backgroundColor: twitDarkGrey,
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tweet.user.name ?? 'Username',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            softWrap: true,
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            '@${tweet.user.username}',
                                            style: TextStyle(
                                              color: twitDarkGrey,
                                              fontSize: 14,
                                            ),
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  PopupMenuButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 0.5,
                                    itemBuilder: (popupCtx) {
                                      return [
                                        PopupMenuItem(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.delete_outlined),
                                              Text('Delete Tweet'),
                                            ],
                                          ),
                                          value: 1,
                                          onTap: () {},
                                        ),
                                        PopupMenuItem(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.edit_outlined),
                                              Text('Edit Tweet'),
                                            ],
                                          ),
                                          value: 2,
                                        ),
                                      ];
                                    },
                                    onSelected: (value) {
                                      if (value == 1) {
                                      } else if (value == 2) {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            // TODO: change to dynamic data
                                            builder: (_) => EditPage(
                                              id: tweet.id,
                                              content: tweet.content ?? '',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    tooltip: 'More',
                                    icon: Icon(
                                      Icons.more_vert_outlined,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                '''${tweet.content}''',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    timeago.format(tweet.createdAt),
                                    style: TextStyle(
                                      color: twitDarkGrey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Divider(
                                height: 3,
                                color: twitGrey,
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(
                                      FontAwesomeIcons.comment,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(
                                      FontAwesomeIcons.retweet,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border,
                                      size: 22,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.share_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Divider(
                                height: 3,
                                color: twitGrey,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container(
                                height: 0.5,
                                color: twitGrey.withOpacity(0.75),
                              );
                            },
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: tweet.replies?.length ?? 0,
                            itemBuilder: (listViewCtx, index) {
                              final reply = tweet.replies?[index];
                              return ReplyTile(
                                tweetId: reply!.id,
                                userId: reply.userId.toString(),
                                username: 'Username 1',
                                postTime: timeago.format(reply.createdAt),
                                content: reply.content,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: twitWhite,
                      boxShadow: [
                        BoxShadow(
                          color: twitGrey,
                          blurRadius: 1.5,
                          blurStyle: BlurStyle.outer,
                          offset: Offset(0, -1),
                          spreadRadius: 1.5,
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _replyInputController,
                            decoration: InputDecoration(
                              hintText: 'Tweet your reply',
                            ),
                            onChanged: (value) => inputCheck(),
                          ),
                        ),
                        Material(
                          child: IconButton(
                            onPressed: isValid ? () {} : null,
                            icon: Icon(
                              Icons.send_outlined,
                              color: isValid
                                  ? twitBlue
                                  : twitBlue.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      }),
    );
  }
}
