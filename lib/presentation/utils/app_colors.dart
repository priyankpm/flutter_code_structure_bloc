import 'package:flutter/material.dart';
import 'package:project_structure_bloc/presentation/utils/app_preference.dart';
import 'package:project_structure_bloc/presentation/utils/enum.dart';

ValueNotifier<String> currentUsedTheme = ValueNotifier<String>(
  UsedTheme.darkTheme.name,
);

class AppColors {
  static Color primaryColor = _LightColor.primaryColor;
  static Color popupBgColor = _LightColor.popupBgColor;
  static Color appbarBgColor = _LightColor.appbarBgColor;
  static Color bottomColor = _LightColor.bottomColor;
  static Color textPrimaryColor = _LightColor.textPrimaryColor;
  static Color textSecondaryColor = _LightColor.textSecondaryColor;
  static Color backgroundColor = _LightColor.backgroundColor;
  static Color buttonTitleColor = _LightColor.buttonTitleColor;
  static Color cardBgColor = _LightColor.cardBgColor;
  static Color cardBgColor2 = _LightColor.cardBgColor2;
  static Color borderColor = _LightColor.borderColor;
  static Color disableColor = _LightColor.disableColor;
  static Color blackColor = _LightColor.blackColor;
  static Color whiteColor = _LightColor.whiteColor;
  static Color transparentColor = _LightColor.transparentColor;
  static Color dividerColor = _LightColor.dividerColor;
  static Color redColor = _LightColor.redColor;
  static Color radioColor = _LightColor.radioColor;
  static Color backArrowColor = _LightColor.radioColor;
  static Color textDefaultColor = _LightColor.textDefaultColor;
  static Color textDisableColor = _LightColor.textDisableColor;

  static Future<void> changeThemeColor({required String usedTheme}) async {
    await AppPreference.setUseThemeName(usedTheme);
    currentUsedTheme.value = usedTheme;
    currentUsedTheme.notifyListeners();
    if (usedTheme == UsedTheme.darkTheme.name) {
      /// TODO : Dark Mode
      primaryColor = _DarkColor.primaryColor;
      appbarBgColor = _DarkColor.appbarBgColor;
      bottomColor = _DarkColor.bottomColor;
      radioColor = _DarkColor.radioColor;
      popupBgColor = _DarkColor.popupBgColor;
      textPrimaryColor = _DarkColor.textPrimaryColor;
      textSecondaryColor = _DarkColor.textSecondaryColor;
      backgroundColor = _DarkColor.backgroundColor;
      buttonTitleColor = _DarkColor.buttonTitleColor;
      cardBgColor = _DarkColor.cardBgColor;
      cardBgColor2 = _DarkColor.cardBgColor2;
      borderColor = _DarkColor.borderColor;
      disableColor = _DarkColor.disableColor;
      blackColor = _DarkColor.blackColor;
      whiteColor = _DarkColor.whiteColor;
      transparentColor = _DarkColor.transparentColor;
      dividerColor = _DarkColor.dividerColor;
      redColor = _DarkColor.redColor;
      backArrowColor = _DarkColor.backArrowColor;
      textDefaultColor = _DarkColor.textDefaultColor;
      textDisableColor = _DarkColor.textDisableColor;
    } else {
      /// TODO : Light Theme
      primaryColor = _LightColor.primaryColor;
      appbarBgColor = _LightColor.appbarBgColor;
      bottomColor = _LightColor.bottomColor;
      popupBgColor = _LightColor.popupBgColor;
      radioColor = _LightColor.radioColor;
      textPrimaryColor = _LightColor.textPrimaryColor;
      textSecondaryColor = _LightColor.textSecondaryColor;
      backgroundColor = _LightColor.backgroundColor;
      buttonTitleColor = _LightColor.buttonTitleColor;
      cardBgColor = _LightColor.cardBgColor;
      cardBgColor2 = _LightColor.cardBgColor2;
      borderColor = _LightColor.borderColor;
      disableColor = _LightColor.disableColor;
      blackColor = _LightColor.blackColor;
      whiteColor = _LightColor.whiteColor;
      transparentColor = _LightColor.transparentColor;
      dividerColor = _LightColor.dividerColor;
      redColor = _LightColor.redColor;
      backArrowColor = _LightColor.backArrowColor;
      textDefaultColor = _LightColor.textDefaultColor;
      textDisableColor = _LightColor.textDisableColor;
    }
  }
}

class _DarkColor {
  static Color primaryColor = const Color(0xFFFFFFFF);
  static Color radioColor = const Color(0xFFFFFFFF);
  static Color appbarBgColor = const Color(0xFF1E1D1D);
  static Color bottomColor = const Color(0xFF1E1D1D);
  static Color backgroundColor = const Color(0xFF000000);
  static Color cardBgColor = const Color(0xFF121634);
  static Color cardBgColor2 = const Color(0xFF080E1C);
  static Color borderColor = const Color(0xFFFFFFFF).withValues(alpha: 0.30);
  static Color dividerColor = const Color(0xFFFFFFFF).withValues(alpha: 0.15);
  static Color popupBgColor = const Color(0xFF121634);
  static Color textPrimaryColor = const Color(0xFFFFFFFF);
  static Color textSecondaryColor = const Color(0xFF9FA6B3);
  static Color buttonTitleColor = const Color(0xFF15151A);
  static Color disableColor = const Color(0xFFA5A5A5);
  static Color blackColor = const Color(0xFF000000);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color redColor = const Color(0xffF44336);
  static Color backArrowColor = const Color(0xFFFFFFFF);
  static Color transparentColor = Colors.transparent;
  static Color textDefaultColor = const Color(0xFFF6F6F6);
  static Color textDisableColor = const Color(0xFF949494);
}

class _LightColor {
  static Color primaryColor = const Color(0xFF000000);
  static Color backgroundColor = const Color(0xFFFFFFFF);
  static Color radioColor = const Color(0xFF000000);
  static Color appbarBgColor = const Color(0xFFE5E3E3);
  static Color bottomColor = const Color(0xFFE5E3E3);
  static Color backArrowColor = const Color(0xFF000000);
  static Color cardBgColor = const Color(0xFFD0CDCD);
  static Color cardBgColor2 = const Color(0xFFDFDFE3);
  static Color borderColor = const Color(0xFF000000).withValues(alpha: 0.30);
  static Color dividerColor = const Color(0xFF9F9F9F).withValues(alpha: 0.30);
  static Color popupBgColor = const Color(0xFFFFFFFF);
  static Color textPrimaryColor = const Color(0xFF000000);
  static Color textSecondaryColor = const Color(0xFF616977);
  static Color buttonTitleColor = const Color(0xFFEAE7E7);
  static Color disableColor = const Color(0xff666666);
  static Color blackColor = const Color(0xFF000000);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color redColor = const Color(0xffF44336);
  static Color transparentColor = Colors.transparent;
  static Color textDefaultColor = const Color(0xFF151515);
  static Color textDisableColor = const Color(0xFFA1A1A1);
}
