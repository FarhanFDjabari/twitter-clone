import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twettir/presenter/cubit/tweet_cubit.dart';

import '../../app_color.dart';

class EditPage extends StatefulWidget {
  final int id;
  final String content;
  const EditPage({Key? key, required this.id, required this.content})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _tweetInputController = TextEditingController();
  bool isValid = false;

  @override
  void initState() {
    _tweetInputController.text = widget.content;
    super.initState();
  }

  @override
  void dispose() {
    _tweetInputController.dispose();
    super.dispose();
  }

  inputCheck() {
    if (_tweetInputController.text.isNotEmpty) {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: twitWhite,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocConsumer<TweetCubit, TweetState>(
              listener: (context, state) {
                if (state is UpdateTweetSuccess) {
                  Navigator.pop(context);
                  context.read<TweetCubit>().getTweets();
                } else if (state is UpdateTweetFailed) {
                  print(state.message);
                }
              },
              builder: (context, state) {
                if (state is UpdateTweetLoading) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: twitBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: twitWhite,
                        strokeWidth: 3,
                      ),
                    ),
                  );
                }
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: twitBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 0,
                  ),
                  onPressed: isValid
                      ? () {
                          context.read<TweetCubit>().updateTweet(
                              widget.id, _tweetInputController.text);
                        }
                      : null,
                  child: Text(
                    "Edit Tweet",
                    style: TextStyle(color: twitWhite),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: twitDarkGrey,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextField(
                          controller: _tweetInputController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'What\'s happening?',
                              hintStyle: TextStyle(fontSize: 16)),
                          onChanged: (value) => inputCheck(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.globeAsia,
                        color: twitBlue,
                        size: 16,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Everyone can reply",
                        style: TextStyle(
                          color: twitBlue,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 2,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.image_outlined),
                color: twitBlue,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.gif_outlined),
                color: twitBlue,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.poll_outlined),
                color: twitBlue,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.pin_drop_outlined),
                color: twitBlue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
