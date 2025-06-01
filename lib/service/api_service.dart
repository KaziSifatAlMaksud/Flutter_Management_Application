import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/employee.dart';
import '../controller/employee_controller.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/employees';

  // Fetch list of employees from API
  static Future<List<Employee>> getEmployees() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);

        // Case 1: API returns a plain list of employee objects
        if (decoded is List) {
          return decoded.map((json) => Employee.fromJson(json)).toList();
        }

        // Case 2: API returns data inside a 'data' key
        if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
          final data = decoded['data'];
          if (data is List) {
            return data.map((json) => Employee.fromJson(json)).toList();
          } else {
            throw Exception("Expected 'data' to be a list");
          }
        }

        throw Exception('Unexpected JSON format');
      } else {
        throw Exception('Failed to load employees. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('❗ Error in getEmployees(): $e');
      rethrow;
    }
  }

  // Create new employee via POST
  static Future<void> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(employee.toJson()),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Failed to create employee');
    }
  }

  // Update existing employee via PUT
  static Future<void> updateEmployee(Employee employee) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${employee.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(employee.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }

  // Delete employee via DELETE
  static Future<void> deleteEmployee(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete employee');
    }
  }
}
