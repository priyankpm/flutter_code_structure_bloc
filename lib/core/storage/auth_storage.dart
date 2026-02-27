import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  static const _domainName = 'domain_Name';
  static const _userUid = 'user_uid';
  static const _isUserLogin = 'is_user_login';
  static const _isSocialLogin = 'is_social_login';
  static const _hasDataInAccount = 'has_data_in_account';
  static const _remainingDays = 'remaining_days';
  static const _socialLoginProcess = 'social_login_process';

  /// ======================== Domain Name ===============================
  Future<void> saveDomainName(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_domainName, token);
  }

  Future<String?> getDomainName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_domainName);
  }

  Future<void> clearDomainName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_domainName);
  }

  /// ======================== User Uid ===============================

  Future<void> saveUserUid(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userUid, token);
  }

  Future<String?> getUserUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userUid);
  }

  Future<void> clearUserUid() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userUid);
  }

  /// ======================== Is User Login ===============================

  Future<void> setIsUserLogin(bool isLoginValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isUserLogin, isLoginValue);
  }

  Future<bool?> getIsUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isUserLogin);
  }

  Future<void> clearIsUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isUserLogin);
  }

  /// ======================== Is SocialUser Login ===============================

  Future<void> setIsSocialUser(bool isSocialUser) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isSocialLogin, isSocialUser);
  }

  Future<bool?> getIsSocialUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isSocialLogin);
  }

  Future<void> clearIsSocialUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isSocialLogin);
  }

  /// ======================== No Data User ===============================
  Future<void> setHasDataInAccount(bool isDataAdd) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasDataInAccount, isDataAdd);
  }

  Future<bool?> getHasDataInAccount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasDataInAccount);
  }

  Future<void> clearHasDataInAccount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_hasDataInAccount);
  }

  /// ======================== Remaining Days Count ===============================
  Future<void> setRemainingDays(int daysCount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_remainingDays, daysCount);
  }

  Future<int?> getRemainingDays() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_remainingDays);
  }

  Future<void> clearRemainingDays() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_remainingDays);
  }

  /// ======================== Social Login Process Complete ===============================
  Future<void> setSocialLoginProcessComplete(bool isProcessComplete) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_socialLoginProcess, isProcessComplete);
  }

  Future<bool?> getSocialLoginProcessComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_socialLoginProcess);
  }

  Future<void> clearSocialLoginProcessComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_socialLoginProcess);
  }
}
