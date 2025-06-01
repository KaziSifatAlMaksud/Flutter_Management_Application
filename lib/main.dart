import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/employee_controller.dart';
import 'routes/routes.dart'; // make sure path is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmployeeController(),
      child: MaterialApp(
        title: 'Your App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: AppRoutes.routes,
      ),
    );
  }
}
