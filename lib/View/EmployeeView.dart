// views/employee_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/employee.dart';
import '../controller/employee_controller.dart';
import '../View/Home/EmployeeForm.dart';

class EmployeeView extends StatefulWidget {
  @override
  _EmployeeViewState createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  late EmployeeController controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<EmployeeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.loadEmployees();
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: AppBar(title: Text("Employee List")),
          body: _isLoading
              ? Center(child: CircularProgressIndicator())
              : controller.employees.isEmpty
              ? Center(child: Text("No employees found"))
              : ListView.builder(
            itemCount: controller.employees.length,
            itemBuilder: (context, index) {
              final employee = controller.employees[index];
              return ListTile(
                title: Text(employee.name),
                subtitle: Text(employee.email),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await controller.deleteEmployee(employee.id);
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return EmployeeForm(
                    onSubmit: (newEmployee) async {
                      await controller.addEmployee(newEmployee);
                    },
                  );
                },
              );
            },
            child: Icon(Icons.add),
          ),

        );
      },
    );
  }
}
