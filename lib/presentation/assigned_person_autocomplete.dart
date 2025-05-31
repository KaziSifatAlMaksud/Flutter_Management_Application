import 'package:flutter/material.dart';

class AssignedPersonAutocomplete extends StatelessWidget {
  final TextEditingController controller;
  final List<String> suggestionList;

  const AssignedPersonAutocomplete({
    super.key,
    required this.controller,
    required this.suggestionList,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return suggestionList.where((String option) {
          return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        controller.text = selection;
      },
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
          FocusNode focusNode, VoidCallback onFieldSubmitted) {
        textEditingController.text = controller.text;
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: const InputDecoration(
            labelText: 'Assigned Person(s)',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            controller.text = value;
          },
        );
      },
    );
  }
}


final List<String> assignedPersonList = [
  'John Doe',
  'Jane Smith',
  'Michael Johnson',
  'Emily Davis',
  'shah alam '
];

