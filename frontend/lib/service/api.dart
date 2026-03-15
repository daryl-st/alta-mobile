import 'package:frontend/service/token_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  // this is also the singleton design pattern to insure only one instance of this class exists throughout the app
  static final Api _instance = Api._internal();
  factory Api() => _instance;
  Api._internal();

  final TokenStorage _tokenStorage = TokenStorage();
  // static const String baseUrl = 'http://localhost:3000/auth';
  static const String baseUrl = 'http://10.47.145.142:3000/auth';

  Future<Map<String, String>> _getHeaders({bool requireAuth = true}) async {
    // if no authentication needed, we can call this function with requireAuth false
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (requireAuth) {
      final token = await _tokenStorage.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requireAuth = false,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(requireAuth: requireAuth);

      final response = await http.post(
        url,
        headers: headers,
        body: body != null
            ? json.encode(body) // convert Dart Map to JSON string
            : null,
      );

      print(response.body);

      return json.decode(response.body); // convert it back to Dart Map
    } catch (err) {
      throw Exception('Network Error: $err');
    }
  }

  Future<dynamic> get(String endpoint, {bool requireAuth = true}) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(requireAuth: requireAuth);

      final response = await http.get(url, headers: headers);

      return json.decode(response.body);
    } catch (err) {
      throw Exception('Network Error: $err');
    }
  }
}
