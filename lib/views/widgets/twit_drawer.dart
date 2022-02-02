import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twettir/app_color.dart';
import 'package:twettir/presenter/cubit/auth_cubit.dart';
import 'package:twettir/views/ui/auth/login.dart';

class TwitDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: twitDarkGrey,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "username",
                          style: TextStyle(
                              color: twitBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "@user",
                          style: TextStyle(color: twitDarkGrey, fontSize: 15),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("0 Followers"),
                            SizedBox(width: 10),
                            Text("0 Following")
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Icon(Icons.person_outlined),
                    title: Text('Profile'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.bookmark_border_outlined),
                    title: Text('Bookmarks'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.topic_outlined),
                    title: Text('Topics'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text('Settings and privacy'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return ListTile(
                          title: CircularProgressIndicator(),
                        );
                      }
                      return ListTile(
                        title: Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {
                          BlocProvider.of<AuthCubit>(context).logout();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.lightbulb_outlined),
                  color: twitBlue,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.qr_code_outlined),
                  color: twitBlue,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
