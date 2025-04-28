import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsTheme {
  static const String currentThemeKey = 'currentTheme';

  static Future<void> updateTheTheme(ThemeMode themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final themeStart = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await prefs.setString(SharedPrefsTheme.currentThemeKey, themeStart);
  }

  Future<ThemeMode> getSavedTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final themeStart =
        prefs.getString(SharedPrefsTheme.currentThemeKey) ?? 'light';

    if (themeStart == 'dark') {
      return ThemeMode.dark;
    } else if (themeStart == 'light') {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }
}
