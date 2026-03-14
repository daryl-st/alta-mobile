import 'package:frontend/service/api.dart';
import 'package:frontend/service/token_storage.dart';
import 'package:frontend/models/auth_response.dart';

class AuthService {
  // we will get the same instance because of singlton design pattern.
  final Api _api = Api();
  final TokenStorage _tokenStorage = TokenStorage();

  Future<AuthResponse> register({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final response = await _api.post(
        '/register',
        body: {'email': email, 'password': password, 'name': name},
      );

      final authResponse = AuthResponse.fromJson(response);

      if (authResponse.success && authResponse.token != null) {
        await _tokenStorage.saveToken(authResponse.token!);
        if (authResponse.user != null) {
          await _tokenStorage.saveUser(authResponse.user!);
        }
      }

      return authResponse;
    } catch (err) {
      return AuthResponse(success: false, message: 'Network error: $err');
    }
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _api.post(
        '/login',
        body: {'email': email, 'password': password},
      );

      final authResponse = AuthResponse.fromJson(response);

      if (authResponse.success && authResponse.token != null) {
        await _tokenStorage.saveToken(authResponse.token!);
        if (authResponse.user != null) {
          await _tokenStorage.saveUser(authResponse.user!);
        }
      }

      return authResponse;
    } catch (err) {
      return AuthResponse(success: false, message: 'Network error $err');
    }
  }

  Future<void> logout() async {
    await _tokenStorage.clearAll();
  }

  Future<bool> isLoggedIn() async {
    return await _tokenStorage.hasToken();
  }
}
