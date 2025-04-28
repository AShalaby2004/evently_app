import 'package:evently_app/utils/shared_prefrance_language.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLocal = 'en';

  LanguageProvider() {
    loadLanguage();
  }

  void changeLanguage(String newLocal) async {
    if (currentLocal == newLocal) {
      return;
    }
    currentLocal = newLocal;
    await SharedPrefsLanguage.updateLanguage(newLocal);
    notifyListeners();
  }

  void loadLanguage() async {
    currentLocal = await SharedPrefsLanguage().getSavedLanguage();
    notifyListeners();
  }
}
