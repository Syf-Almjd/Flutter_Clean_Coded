import 'package:flutter_clean_coded/src/domain/models/General/image_model.dart';

class UserModel {
  int userId;
  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;
  String gender;
  String userRole;
  String userType;
  String userStatus;
  ImageModel image;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.gender,
    required this.userRole,
    required this.userType,
    required this.userStatus,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: (json['userId'] ?? 0.0).toInt(),
      username: json['username'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      image: ImageModel.fromJson(json['image']),
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      phone: json['phone'] ?? "",
      gender: json['gender'] ?? "",
      userRole: json['userRole'] ?? "",
      userStatus: json['userStatus'] ?? "",
      userType: json['userType'] ?? "",
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt']).toLocal()
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt']).toLocal()
          : DateTime.now(),
    );
  }

  factory UserModel.loadingUser() {
    return UserModel(
      userId: 0,
      username: "Loading",
      firstName: "Loading",
      image: ImageModel(
          imageId: 0,
          imageIndex: 0,
          imageUrl: 'https://loading.io/assets/mod/spinner/spinner/lg.gif',
          uploadedAt: ''),
      lastName: "",
      email: "Loading",
      password: "",
      phone: "",
      gender: "",
      userRole: "",
      userType: "",
      createdAt: DateTime.now(),
      userStatus: '',
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toLocalJson() {
    return {
      'userId': userId,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      "image": image.toFullJson(),
      'password': password,
      'phone': phone,
      'gender': gender,
      'userRole': userRole,
      'userStatus': userStatus,
      'userType': userType,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Map<String, dynamic> toServerJson() {
    String? nullPass = password;
    if (password.isEmpty || password == "null") {
      nullPass = null;
    }

    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': nullPass,
      'gender': gender,
      "image": image.toUploadJson()
    };
  }
}
