import 'package:flutter/material.dart';
import '../model/employee.dart';
import '../service/api_service.dart';


class EmployeeController extends ChangeNotifier {
  List<Employee> employees = [];

  // Load all employees from API
  Future<void> loadEmployees() async {
    try {
      employees = await ApiService.getEmployees();
      notifyListeners();
    } catch (e) {
      print('❗ Error loading employees: $e');
    }
  }

  // Add a new employee
  Future<void> addEmployee(Employee employee) async {
    try {
      await ApiService.createEmployee(employee); // 👈 This stores in DB
      await loadEmployees();
    } catch (e) {
      print('❗ Error adding  employee: $e');
    }
  }



  // Update an existing employee
  Future<void> updateEmployee(Employee employee) async {
    try {
      await ApiService.updateEmployee(employee);
      await loadEmployees();
    } catch (e) {
      print('❗ Error updating employee: $e');
    }
  }

  // Delete an employee by ID
  Future<void> deleteEmployee(int id) async {
    try {
      await ApiService.deleteEmployee(id);
      await loadEmployees();
    } catch (e) {
      print('❗ Error deleting employee: $e');
    }
  }
}
