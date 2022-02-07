import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'presenter/cubit/tweet_cubit.dart';
import 'services/tweet_service.dart';
import 'views/app.dart';
import 'presenter/cubit/auth_cubit.dart';
import 'views/ui/auth/login.dart';
import 'app_color.dart';
import 'services/auth_service.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(AuthService())..checkAuth()),
        BlocProvider(create: (_) => TweetCubit(TweetService()))
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
          home: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated)
                return App();
              else if (state is AuthLoading)
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              else
                return LoginPage();
            },
          )),
    );
  }
}
