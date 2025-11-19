import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottomNavigationBar.dart';
import '../widgets/rightDrawer.dart';
import '../widgets/topbar.dart';
import '../widgets/homeCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String employeeId = '';
  String employeeName = '';
  String departmentName = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load SharedPreferences data
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      employeeId  = prefs.getString("username") ?? "00000";
      employeeName = prefs.getString("first_name") ?? "No Name";
      departmentName = prefs.getString("department_name") ?? "No Department";
    });
  }

  // Sign out function
  Future<void> signOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Signed out successfully!"),
        backgroundColor: Colors.red,
      ),
    );

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Topper(),
      endDrawer: RightDrawer(onItemTapped: (index) => _navigateTo(context, index)),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) => _navigateTo(context, index),
      ),
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
                        children: [
                          Text(
                            employeeName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('ID: $employeeId'),
                          Text('$departmentName'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 2.0,
                runSpacing: 8.0,
                children: [
                  buildCard(context, '/users', Icons.backup_table_outlined, 'Employee'),
                  buildCard(context, '/home', Icons.home, 'Home'),
                  buildCard(context, '/employee_view', Icons.pages_outlined, 'Employee View'),
                  buildCard(context, '/create_issue', Icons.sync_problem, 'Issue'),
                  buildCard(context, '/signUp', Icons.login, 'Sign Up'),
                  buildCard(context, '/signOut', Icons.logout, 'Sign Out'),
                  buildCard(context, '/maltipleTab', Icons.tab, 'Multiple Tab'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
