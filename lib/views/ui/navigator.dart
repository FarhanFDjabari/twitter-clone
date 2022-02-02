import 'package:flutter/material.dart';
import 'package:twettir/common/cache.dart';

import '../app.dart';
import 'auth/login.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  Future<bool> isLoggedIn() async {
    final result = await Cache.getData('user_data');
    if (result != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return snapshot.data == true ? App() : LoginPage();
          }
        }
        return LoginPage();
      },
    );
  }
}
