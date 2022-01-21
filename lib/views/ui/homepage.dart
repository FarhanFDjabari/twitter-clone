import 'package:flutter/material.dart';
import 'package:twettir/app_color.dart';
import 'package:twettir/views/widgets/tweet_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 0.5,
              color: twitGrey.withOpacity(0.75),
            );
          },
          itemCount: 3,
          itemBuilder: (listViewCtx, index) {
            return TweetTile();
          },
        ),
      ),
    );
  }
}
