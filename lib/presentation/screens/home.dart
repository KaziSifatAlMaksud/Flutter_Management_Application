import 'package:flutter/material.dart';
import '../widgets/bottomNavigationBar.dart';
import '../widgets/rightDrawer.dart';
import '../widgets/topbar.dart';

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
                elevation: 4,
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

            // Grid of Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/users');
                        },
                        child: const Text('Employee List'),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
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
