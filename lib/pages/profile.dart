import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        leading: BackButton(), // Shows back button
      ),
      body: Center(
        child: Text(
          'Welcome to the Profile Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
