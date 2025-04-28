import 'package:evently_app/utils/shared_prefrance_theme.dart';
import 'package:flutter/material.dart';

class ThemeProdiver extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) {
      return;
    }
    currentTheme = newTheme;
    SharedPrefsTheme.updateTheTheme(newTheme);
    notifyListeners();
  }

  void loadThemeApp() async {
    currentTheme = await SharedPrefsTheme().getSavedTheme();
    notifyListeners();
  }

  ThemeProdiver() {
    loadThemeApp();
  }
}
