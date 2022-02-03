import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twettir/views/app.dart';
import 'app_color.dart';
import 'presenter/cubit/auth_cubit.dart';
import 'views/ui/auth/login.dart';

import 'common/cache.dart';
import 'services/auth_service.dart';

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
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthCubit(AuthService()))],
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
        home: FutureBuilder(
          future: isLoggedIn(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return snapshot.data == true ? App() : LoginPage();
              }
            }
            return LoginPage();
          },
        ),
      ),
    );
  }
}
