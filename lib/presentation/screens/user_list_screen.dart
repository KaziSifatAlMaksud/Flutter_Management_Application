import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import '../../service/user_service.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> futureUsers;
  final UserService userService = UserService();

  List<User> _allUsers = [];
  List<User> _filteredUsers = [];
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    futureUsers = userService.fetchUsers();
    futureUsers.then((users) {
      setState(() {
        _allUsers = users;
        _filteredUsers = users;
      });
    });
  }

  void _filterUsers(String query) {
    final filtered = _allUsers.where((user) {
      final name = user.userName?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();

    setState(() {
      _searchQuery = query;
      _filteredUsers = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee List')),
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterUsers,
              decoration: InputDecoration(
                labelText: 'Search by name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),

          // 📄 User List
          Expanded(
            child: FutureBuilder<List<User>>(
              future: futureUsers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (_filteredUsers.isEmpty) {
                  return Center(child: Text('No employees found.'));
                }

                return ListView.builder(
                  itemCount: _filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = _filteredUsers[index];

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          (user.userName ?? '?').isNotEmpty
                              ? user.userName![0].toUpperCase()
                              : '?',
                        ),
                      ),
                      title: Text(user.userName ?? 'Unknown'),
                      subtitle: Text('Level: ${user.userLevel ?? 'N/A'}'),
                      trailing: Icon(
                        user.isActive == 1 ? Icons.check_circle : Icons.cancel,
                        color: user.isActive == 1 ? Colors.green : Colors.red,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
