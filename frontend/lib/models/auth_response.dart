import 'user.dart';

class AuthResponse {
  final bool success;
  final String? message;
  final User? user;
  final String? token;

  AuthResponse({required this.success, this.message, this.token, this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'],
      message: json['message'],
      user: json['data']?['user'] != null
          ? User.fromJson(json['data']['user'])
          : null,
      token: json['data']?['token'],
    );
  }
}
