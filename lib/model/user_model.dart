class User {
  final String? userId;
  final String? userName;
  final String? userPassword;
  final String? userLevel;
  final dynamic loginStatus;
  final int? isActive;
  final String? token;
  final dynamic modifiedBy;
  final dynamic modifiedTime;
  final String? createdBy;
  final String? createdAt;

  User({
    this.userId,
    this.userName,
    this.userPassword,
    this.userLevel,
    this.loginStatus,
    this.isActive,
    this.token,
    this.modifiedBy,
    this.modifiedTime,
    this.createdBy,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id']?.toString(),
      userName: json['user_name']?.toString(),
      userPassword: json['user_password']?.toString(),
      userLevel: json['user_level']?.toString(),
      loginStatus: json['login_status'],
      isActive: json['is_active'] ?? 0,
      token: json['token']?.toString(),
      modifiedBy: json['modified_by'],
      modifiedTime: json['modified_time'],
      createdBy: json['created_by']?.toString(),
      createdAt: json['created_at']?.toString(),
    );
  }
}
