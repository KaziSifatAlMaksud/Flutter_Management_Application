class IssueModel {
  final int issueId;
  final String createdBy;
  final String projectCode;
  final String createdByName;
  final String projectName;
  final String pmDate;
  final String submitStatus;
  final int detailId;
  final String pmHoFeedback;
  final int pmFeedback;
  final String issueType;
  final String issueDetails;
  final String concernDepartment;
  final String expectDate;
  final String assignedPerson;
  final String concernDepartmentName;
  final String assignedPersonByName;

  IssueModel({
    required this.issueId,
    required this.createdBy,
    required this.projectCode,
    required this.createdByName,
    required this.projectName,
    required this.pmDate,
    required this.submitStatus,
    required this.detailId,
    required this.pmHoFeedback,
    required this.pmFeedback,
    required this.issueType,
    required this.issueDetails,
    required this.concernDepartment,
    required this.expectDate,
    required this.assignedPerson,
    required this.concernDepartmentName,
    required this.assignedPersonByName,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return IssueModel(
      issueId: json['issue_id'],
      createdBy: json['created_by'],
      projectCode: json['project_code'],
      createdByName: json['created_by_name'],
      projectName: json['project_name'],
      pmDate: json['pm_date'],
      submitStatus: json['submit_status'],
      detailId: json['detail_id'],
      pmHoFeedback: json['pm_ho_feedback'],
      pmFeedback: json['pm_feedback'],
      issueType: json['issue_type'],
      issueDetails: json['issue_details'],
      concernDepartment: json['concern_department'],
      expectDate: json['expect_date'],
      assignedPerson: json['assigned_person'],
      concernDepartmentName: json['concern_department_name'],
      assignedPersonByName: json['assigned_person_by_name'],
    );
  }
}
