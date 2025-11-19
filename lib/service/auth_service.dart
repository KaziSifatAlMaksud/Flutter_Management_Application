import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = "http://127.0.0.1:8000/api";

  static Future<bool> login(String username, String password) async {
    final url = Uri.parse("$baseUrl/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    // Check API response
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final user = json["data"];  // your API returns { message, data: { userData } }

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString("user_id", user["user_id"]);
      await prefs.setString("username", user["username"]);
      await prefs.setString("first_name", user["first_name"]);
      await prefs.setString("department_name", user["department_name"]);
      await prefs.setString("role", user["role"]);

      return true;
    }

    return false;
  }
}
