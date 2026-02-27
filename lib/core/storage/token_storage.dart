import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const _key = 'auth_token';
  static const _saveLocalTimezone = 'local_timezone';
  static const _saveDeviceToken = 'device_token';

  /// ======================== AccessToken ===============================
  Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  Future<void> clearAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  /// ======================== LocalTimeZone ===============================
  Future<void> saveLocalTimeZone(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_saveLocalTimezone, token);
  }

  Future<String?> getLocalTimeZone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_saveLocalTimezone);
  }

  Future<void> clearLocalTimeZone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_saveLocalTimezone);
  }

  /// ======================== Device Token ===============================
  Future<void> saveDeviceToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_saveDeviceToken, token);
  }

  Future<String?> getDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_saveDeviceToken);
  }

  Future<void> clearDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_saveDeviceToken);
  }
}
