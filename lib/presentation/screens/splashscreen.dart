import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startSplashProcess();
  }

  Future<void> startSplashProcess() async {
    // Show splash image for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Now check login status
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt("user_id");

    if (!mounted) return;

    if (userId != null) {
      // User exists → Go to Home
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      // No user → Go to Login
      Navigator.pushReplacementNamed(context, "/signUp");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/image/preloader.jpg',
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
