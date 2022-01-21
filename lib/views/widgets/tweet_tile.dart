import 'package:flutter/material.dart';
import 'package:twettir/app_color.dart';

class TweetTile extends StatelessWidget {
  const TweetTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: twitDarkGrey,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Username',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' @user ',
                style: TextStyle(
                  color: twitDarkGrey,
                  fontSize: 14,
                ),
              ),
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: twitDarkGrey,
                ),
              ),
              Text(
                ' 10m',
                style: TextStyle(
                  color: twitDarkGrey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
            splashRadius: 15,
          ),
        ],
      ),
      visualDensity: VisualDensity.comfortable,
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Flutter & Flame: Effects and ads published by @RealDevOwl in \n#FlutterCommunity \n\nmedium.com/flutter-community/flutter-flame-effects-and-ads-3e243009d18c \n\ncc:  #Flutter @nlycskn \n@r_FlutterDev',
            overflow: TextOverflow.ellipsis,
            maxLines: 9,
            softWrap: true,
            textAlign: TextAlign.left,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.chat),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.chat),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.chat),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.chat),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
