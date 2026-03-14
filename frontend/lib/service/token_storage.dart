import 'package:frontend/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  // this is sigleton design pattern to make sure only one instance of this class exists throughout the app
  // this creates a single permanent storage location for TokenStorage object
  static final TokenStorage _instance = TokenStorage._internal();
  // it's constructor that always return existing instance, whenever anyone does TokenStorage(), they get the SAME _instance
  factory TokenStorage() => _instance;
  // private constructor whcih can only be called from inside the class
  TokenStorage._internal();

  // These are keys to store/retrive data, which are constant and static
  static const String _tokenKey = 'auth-token';
  static const String _userKey = 'user-data';

  // Future is like a Promise in JS/TS, they handle async/await operations
  Future<void> saveToken(String token) async {
    // SharedPreference is permanent dictionary [key, value - pair] that survives app restarts
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, '${user.id}|${user.name}|${user.email}');
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(_userKey);

    if (userString != null) {
      final parts = userString.split('|');
      return User(id: parts[0], email: parts[2], name: parts[1]);
    }
    return null;
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }

  Future<bool> hasToken() async {
    return await getToken() != null;
  }
}
