import 'package:project_structure_bloc/presentation/utils/app_preference.dart';

class SplashRedirectionStorage {
  static const String _isOnBoardingPass = 'isOnBoardingPass';

  Future setOnBoarding(bool value) async {
    await AppPreference.prefs.setBool(_isOnBoardingPass, value);
  }

  bool? getOnBoarding() {
    return AppPreference.prefs.getBool(_isOnBoardingPass);
  }
}
