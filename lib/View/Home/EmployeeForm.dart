import 'package:flutter/material.dart';
import '../../model/employee.dart';

class EmployeeForm extends StatefulWidget {
  final Function(Employee) onSubmit;

  const EmployeeForm({required this.onSubmit, super.key});

  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Employee'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onSaved: (val) => name = val ?? '',
              validator: (val) => val == null || val.isEmpty ? 'Enter name' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (val) => email = val ?? '',
              validator: (val) => val == null || val.isEmpty ? 'Enter email' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: Text('Submit'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final newEmployee = Employee(id: 0, name: name, email: email);
              widget.onSubmit(newEmployee); // Pass the employee back
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
