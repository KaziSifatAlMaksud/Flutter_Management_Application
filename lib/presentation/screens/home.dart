import 'package:flutter/material.dart';
import '../widgets/bottomNavigationBar.dart';
import '../widgets/rightDrawer.dart';
import '../widgets/topbar.dart';
import '../widgets/homeCard.dart';

class HomePage extends StatelessWidget {
  static const String employeeId = 'EMP001';
  static const String employeeName = 'Kazi Sifat Al Maksud';
  static const String designation = 'Web Developer';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Topper(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Employee Info Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/image/proloader.jpg'),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            employeeName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('ID: $employeeId'),
                          Text(designation),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 2.0, // Horizontal space between cards
                runSpacing: 8.0, // Vertical space between rows
                children: [
                  buildCard(context, '/users', Icons.backup_table_outlined , 'Employee'),
                  buildCard(context, '/home', Icons.home, 'Home'),
                  buildCard(context, '/home', Icons.home, 'Home'),
                  buildCard(context, '/home', Icons.home, 'Home'),
                  buildCard(context, '/home', Icons.home, 'Home'),
                  buildCard(context, '/signUp', Icons.login, 'Sing Up'),
                  buildCard(context, '/signUp', Icons.login, 'Sing Up'),
                  buildCard(context, '/maltipleTab', Icons.tab, 'Maltiple Tab'),
                  // buildCard(),
                  // buildCard(),
                  // buildCard(),
                ],
              ),
            )


          ],
        ),
      ),
      endDrawer: RightDrawer(onItemTapped: (index) {
        _navigateTo(context, index);
      }),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) => _navigateTo(context, index),
      ),
    );
  }

  void _navigateTo(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/users');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }
}
