import 'package:flutter/material.dart';
import 'routes/routes.dart'; // update the path if needed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: AppRoutes.routes,
    );
  }
}
