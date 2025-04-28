import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsLanguage {
  static const String currentLanguageKey = 'currentLanguage';

  static Future<void> updateLanguage(String currentLanguage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        SharedPrefsLanguage.currentLanguageKey, currentLanguage);
  }

  Future<String> getSavedLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String startLanguage =
        prefs.getString(SharedPrefsLanguage.currentLanguageKey) ?? 'en';
    return startLanguage;
  }
}
