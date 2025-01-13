class SignUpModelRequest {
  final String email;
  final String password;
  final String userType;
  final String username;

  SignUpModelRequest({
    required this.email,
    required this.username,
    required this.password,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      "userType": userType,
      "email": email,
      "username": username,
      "password": password,
    };
  }
}

class SignUpModelResponse {
  final String? userType;
  final String? email;
  final String? message;
  final String? userStatus;
  final String? token;

  SignUpModelResponse({
    required this.email,
    required this.userType,
    required this.message,
    required this.userStatus,
    required this.token,
  });

  factory SignUpModelResponse.fromJson(Map<String, dynamic> json) {
    return SignUpModelResponse(
      email: json['email'] ?? "NULL",
      message: json['message'] ?? "NULL",
      token: json['token'] ?? "NULL",
      userStatus: json['userStatus'] ?? "NULL",
      userType: json['userType'] ?? "NULL",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userType': userType,
      'email': email,
      'message': message,
      'userStatus': userStatus,
      'token': token,
    };
  }
}
