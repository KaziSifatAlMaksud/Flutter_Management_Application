import 'package:flutter/material.dart';
import '../presentation/screens/home.dart';
import '../presentation/screens/user_list_screen.dart';
import '../presentation/screens/profile.dart';
import '../presentation/screens/splashscreen.dart';
import '../presentation/screens/signUpScreen3.dart';
import '../presentation/screens/PM_management.dart';
import '../presentation/screens/PM/pm_create_isssue.dart';
import '../View/EmployeeView.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
    // '/': (context) =>  SplashScreen(),
    '/': (context) =>  HomePage(),
    '/home': (context) => const HomePage(),
    '/users': (context) => UserListScreen(),
    '/employee_view': (context) => EmployeeView(),
    '/profile': (context) =>  ProfilePage(),
    '/signUp' : (context) => SignInPage(),
    '/create_issue' : (context) => IssueFormPage(),
    '/maltipleTab' : (context) => MultiTableTabPage(),

  };
}
