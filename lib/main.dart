import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'app_color.dart';
import 'models/User.dart';
import 'presenter/cubit/auth_cubit.dart';
import 'views/ui/auth/login.dart';
import 'views/ui/homepage.dart';

import 'common/cache.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> isLoggedIn() async {
    final result = await Cache.getData('user_data');
    if (result != null) {
      return true;
    }
    return false;
  }

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit(UserRepository()))
        ],
        child: FutureBuilder(
          future: isLoggedIn(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data == true ? HomePage() : LoginPage();
            }
            return LoginPage();
          },
        ),
      ),
    );
  }
}
