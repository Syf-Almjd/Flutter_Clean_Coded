class UserCredentialsModel {
  final String email;
  final String password;

  UserCredentialsModel({
    required this.email,
    required this.password,
  });

  factory UserCredentialsModel.fromJson(Map<String, dynamic> json) {
    return UserCredentialsModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
