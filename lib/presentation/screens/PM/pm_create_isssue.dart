import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../assigned_person_autocomplete.dart';
import '../../concerned_deparment_autocomplete.dart';

class IssueFormPage extends StatefulWidget {
  @override
  _IssueFormPageState createState() => _IssueFormPageState();
}

class _IssueFormPageState extends State<IssueFormPage> {
  List<IssueRow> issues = [];

  @override
  void initState() {
    super.initState();
    issues.add(IssueRow());
  }

  void addIssueRow() {
    setState(() {
      issues.add(IssueRow());
    });
  }

  void removeIssueRow(int index) {
    setState(() {
      if (issues.length > 1) {
        issues[index].dispose(); // Dispose the controllers before removing
        issues.removeAt(index);
      }
    });
  }

  void submitForm() {
    for (int i = 0; i < issues.length; i++) {
      print("Issue ${i + 1}:");
      print("Type: ${issues[i].issueType}");
      print("Description: ${issues[i].descriptionController.text}");
      print("Manpower: ${issues[i].manpowerController.text}");
      print("Date: ${issues[i].dateController.text}");
      print("concernedDepController: ${issues[i].concernedDepController.text}");
      print("assignedPerson: ${issues[i].assignedPersonController.text}");
      print("-------------");
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Form 22 Submitted!")),
    );
  }

  @override
  void dispose() {
    for (var issue in issues) {
      issue.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Issues Form'),
        elevation: 4, // Adds a real shadow
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: addIssueRow,
                  icon: Icon(Icons.add, size: 20),
                  label: Text("Add Issue"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: issues.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Issue ${index + 1}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              if (issues.length > 1)
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removeIssueRow(index),
                                ),
                            ],
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(labelText: 'Issue Type'),
                            value: issues[index].issueType,
                            items: [
                              'Design',
                              'Decision',
                              'Fund',
                              'Specification',
                              'Machinery',
                              'Manpower',
                              'Others'
                            ]
                                .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                issues[index].issueType = val!;
                              });
                            },
                          ),
                          TextFormField(
                            controller: issues[index].descriptionController,
                            decoration: InputDecoration(labelText: 'Issue Description'),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: issues[index].manpowerController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(labelText: 'Issue Manpower'),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: issues[index].dateController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Select Date',
                                    suffixIcon: Icon(Icons.calendar_today),
                                  ),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2100),
                                    );

                                    if (pickedDate != null) {
                                      setState(() {
                                        issues[index].dateController.text =
                                            DateFormat('yyyy-MM-dd').format(pickedDate);
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ConcernedDepartmentAutocomplete(
                                  controller: issues[index].concernedDepController,
                                  // onSelected: (deptId) {
                                  //   issues[index].concernedDepId = deptId;
                                  // },
                                ),

                              ),
                              SizedBox(width: 16), // Add some spacing between fields
                              Expanded(
                                child: AssignedPersonAutocomplete(
                                  controller: issues[index].assignedPersonController,
                                  // onSelected: (personId) {
                                  //   issues[index].assignedPersonId = personId;  // <-- Save ID here
                                  // },
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                child: Text("Submit All Issues"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class IssueRow {
  String issueType;
  TextEditingController descriptionController;
  TextEditingController manpowerController;
  TextEditingController dateController;
  TextEditingController concernedDepController;
  TextEditingController assignedPersonController;
  int? concernedDepId;
  int? assignedPersonId;
  IssueRow({
    this.issueType = 'Design',
  })  : descriptionController = TextEditingController(),
        manpowerController = TextEditingController(),
        dateController = TextEditingController(),
        concernedDepController = TextEditingController(),
        assignedPersonController = TextEditingController();
  void dispose() {
    descriptionController.dispose();
    manpowerController.dispose();
    dateController.dispose();
    concernedDepController.dispose();
    assignedPersonController.dispose();
  }
}
