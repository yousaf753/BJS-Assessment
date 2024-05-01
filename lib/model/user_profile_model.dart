import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  String username;
  String email;
  String gender;
  String dob;
  bool account;
  bool notification;
  bool theme;

  UserProfileModel({
    required this.username,
    required this.email,
    required this.gender,
    required this.dob,
    required this.account,
    required this.notification,
    required this.theme,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        gender: json["gender"] ?? "",
        dob: json["dob"] ?? "",
        account: json["account"] ?? false,
        notification: json["notification"] ?? false,
        theme: json["theme"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "gender": gender,
        "dob": dob,
        "account": account,
        "notification": notification,
        "theme": theme,
      };
}
