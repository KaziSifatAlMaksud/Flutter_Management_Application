import 'package:flutter/material.dart';
import '../presentation/screens/home.dart';
import '../presentation/screens/user_list_screen.dart';
import '../presentation/screens/profile.dart';
import '../presentation/screens/splashscreen.dart';
import '../presentation/screens/signUpScreen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
    // '/': (context) =>  SplashScreen(),
    '/': (context) =>  HomePage(),
    '/home': (context) => const HomePage(),
    '/users': (context) => UserListScreen(),
    '/profile': (context) =>  ProfilePage(),
    '/signUp' : (context) => SignInPage(),
  };
}
