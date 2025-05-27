import 'package:flutter/material.dart';
import 'package:untitled6/pages/user_list_screen.dart';
import 'pages/splashscreen.dart';
import 'pages/home.dart';
import 'pages/user_list_screen.dart';

import 'pages/profile.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash & Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Use named routes
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/employeelist':  (context) => UserListScreen()
      },
    );
  }
}


