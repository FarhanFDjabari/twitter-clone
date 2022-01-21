import 'package:flutter/material.dart';
import 'package:twettir/app_color.dart';

import '/views/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twettir',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: twitWhite,
          elevation: 1.5,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: twitBlue,
          selectedIconTheme: IconThemeData(color: twitBlue),
        ),
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: twitBlue)),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
