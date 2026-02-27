import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enum.dart';

class AppPreference {
  static late SharedPreferences prefs;
  static const String _themeKey = 'theme';

  static Future initMySharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void clearSharedPreferences() {
    prefs.clear();
    return;
  }


  static String getUsedThemeName() {
    final String? value = prefs.getString(_themeKey);
    if (value == null) {
      var brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      return isDarkMode ? UsedTheme.darkTheme.name : UsedTheme.lightTheme.name;
    } else {
      return value;
    }
  }

  static Future setUseThemeName(String value) async {
    await prefs.setString(_themeKey, value);
  }

  static Future setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  static String getString(String key) {
    final String? value = prefs.getString(key);
    return value ?? "";
  }

  static Future setBoolean(String key, {required bool value}) async {
    await prefs.setBool(key, value);
  }

  static bool getBoolean(String key) {
    final bool? value = prefs.getBool(key);
    return value ?? true;
  }

  static Future setLong(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  static double getLong(String key) {
    final double? value = prefs.getDouble(key);
    return value ?? 0.0;
  }

  static Future setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  static int getInt(String key) {
    final int? value = prefs.getInt(key);
    return value ?? 0;
  }
}
