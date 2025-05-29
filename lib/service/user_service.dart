import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class UserService {
  final String baseUrl = 'http://127.0.0.1:8000/api/use-fetch';

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        // Case 1: Response is a List of users
        if (decoded is List) {
          return decoded.map((json) => User.fromJson(json)).toList();
        }

        // Case 2: Response is a Map with a 'data' key
        if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
          final List<dynamic> data = decoded['data'];
          return data.map((json) => User.fromJson(json)).toList();
        }

        throw Exception('Unexpected response structure');
      } else {
        throw Exception('Failed to load users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Exception fetching users: $e');
    }
  }
}
