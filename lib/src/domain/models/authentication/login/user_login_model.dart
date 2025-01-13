class LoginModelRequest {
  final String email;
  final String password;

  LoginModelRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginModelRequest.fromJson(Map<String, dynamic> json) {
    return LoginModelRequest(
      email: json['email'],
      password: json['password'],
    );
  }
}

class LoginModelResponse {
  final String userType;
  final String email;
  final String message;
  final String userStatus;
  final String token;

  LoginModelResponse({
    required this.email,
    required this.userStatus,
    required this.userType,
    required this.message,
    required this.token,
  });

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) {
    return LoginModelResponse(
      email: json['email'],
      message: json['message'],
      token: json['token'],
      userType: json['userType'],
      userStatus: json['userStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userType': userType,
      'email': email,
      'userStatus': userStatus,
      'message': message,
      'token': token,
    };
  }
}
