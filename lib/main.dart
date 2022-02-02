import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twettir/views/app.dart';
import 'package:twettir/views/ui/navigator.dart';
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
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(UserRepository()))
      ],
      child: MaterialApp(
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
        home: Navigation(),
      ),
    );
  }
}
