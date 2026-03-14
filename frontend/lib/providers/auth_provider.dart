import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/service/auth_service.dart';
import 'package:frontend/service/token_storage.dart';

// ChangeNotifier provides change notification to it's listeners with the help of providers
class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final TokenStorage _tokenStorage = TokenStorage();

  User? _user; // curent user (null if not logged in)
  bool _isLoading = false; // are we in the middle of async operation
  String? _error; // any error message to display

  // public getters
  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  AuthProvider() {
    checkAuthStatus(); // run this when the provider is created
  }

  Future<void> checkAuthStatus() async {
    _isLoading = true;
    // this tell all listeners: "I changed! Update yourselves!"
    // the builder function in widgets run whenever this function is called
    notifyListeners();

    // to check if the user has any valid tokens | if previosly logged in
    _user = await _tokenStorage.getUser();
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> register({
    required String email,
    required String password,
    required String name,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final response = await _authService.register(
      email: email,
      name: name,
      password: password,
    );

    if (response.success) {
      _user = response.user; // user logged in
    } else {
      _error = response.message; // show error
    }

    _isLoading = false;
    notifyListeners();
    return response.success;
  }

  Future<bool> login({required String email, required String password}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final response = await _authService.login(email: email, password: password);

    if (response.success) {
      _user = response.user; // user logged in
    } else {
      _error = response.message; // show error
    }

    _isLoading = false;
    notifyListeners();
    return response.success;
  }

  Future<void> logout() async {
    await _authService.logout();
    _user = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
