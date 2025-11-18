import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // For JSON parsing

class ConcernedDepartmentAutocomplete extends StatefulWidget {
  final TextEditingController controller;

  const ConcernedDepartmentAutocomplete({
    super.key,
    required this.controller,
  });

  @override
  _ConcernedDepartmentAutocompleteState createState() =>
      _ConcernedDepartmentAutocompleteState();
}

class _ConcernedDepartmentAutocompleteState
    extends State<ConcernedDepartmentAutocomplete> {
  late List<String> suggestionList = [];
  bool isLoading = true;
  String errorMessage = '';

  // Fetch the list of departments from the API
  Future<void> fetchDepartments() async {
    const apiUrl = 'http://127.0.0.1:8000/api/getDepmartment';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = json.decode(response.body);

        if (data['message'] == 'Employees retrieved successfully') {
          // Map the 'name' of departments into the suggestion list
          List<dynamic> departments = data['data'];
          setState(() {
            suggestionList =
                departments.map((e) => e['name'] as String).toList();
            isLoading = false;
          });
        } else {
          setState(() {
            errorMessage = 'Failed to load department data';
            isLoading = false;
          });
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error fetching data: $error';
      });
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDepartments();  // Fetch data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    // Show loading indicator while fetching data
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    // Show error message if fetching fails
    if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage));
    }

    // Autocomplete widget for department names
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        // Filter the suggestions list based on input text
        return suggestionList.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        widget.controller.text = selection;
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        textEditingController.text = widget.controller.text;
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: const InputDecoration(
            labelText: 'Concerned Department',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            widget.controller.text = value;
          },
        );
      },
    );
  }
}
