class LoginModel {
  final String username;
  final String password;

  const LoginModel({
    required this.username,
    required this.password,
  });

  /// Convert JSON response to LoginModel
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'] ?? "",
      password: json['password'] ?? "",
    );
  }

  /// Convert LoginModel to JSON for request or Post
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
