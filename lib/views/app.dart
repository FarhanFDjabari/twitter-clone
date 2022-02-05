import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twettir/presenter/cubit/tweet_cubit.dart';

import '../app_color.dart';
import '../views/ui/compose.dart';
import '../views/ui/homepage.dart';
import '../views/ui/messages.dart';
import '../views/ui/notifications.dart';
import '../views/ui/search.dart';
import '../views/widgets/twit_drawer.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: twitWhite,
      drawer: TwitDrawer(),
      appBar: AppBar(
        backgroundColor: twitWhite,
        elevation: 1,
        centerTitle: true,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: twitBlue,
        ),
        actions: [
          _pageIndex != 0
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings_outlined),
                )
              : Container()
        ],
      ),
      body: _pageIndex == 0
          ? HomePage()
          : _pageIndex == 1
              ? SearchPage()
              : _pageIndex == 2
                  ? NotificationsPage()
                  : MessagesPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Compose()))
            .then(
              (_) => context.read<TweetCubit>().getTweets(),
            ),
        elevation: 1,
        backgroundColor: twitBlue,
        child: Icon(
          Icons.add,
          color: twitWhite,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 1.5,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(_pageIndex == 0 ? Icons.home : Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(_pageIndex == 1 ? Icons.search : Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(_pageIndex == 2
                ? Icons.notifications
                : Icons.notifications_outlined),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(_pageIndex == 3 ? Icons.mail : Icons.mail_outline),
            label: "Messages",
          ),
        ],
      ),
    );
  }
}
