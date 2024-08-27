import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  Locale langCode = const Locale("ar");

  late SharedPreferences sharedPreferences;

  Future<void> getThemeLang() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool("isArabic") ?? false) {
      langCode = const Locale("ar");
    } else {
      langCode = const Locale("en");
    }

    if (sharedPreferences.getBool("isDark") ?? false) {
      appTheme = ThemeMode.dark;
    } else {
      appTheme = ThemeMode.light;
    }
  }

  changeTheme(ThemeMode mode) {
    appTheme = mode;
    notifyListeners();
    bool isDark = appTheme == ThemeMode.dark ? true : false;
    _saveTheme(isDark);
  }

  void _saveLang(bool isArabic) {
    sharedPreferences.setBool("isArabic", isArabic);
  }

  void _saveTheme(bool isDark) {
    sharedPreferences.setBool("isDark", isDark);
  }

  changeLanguage(Locale local) {
    langCode = local;
    notifyListeners();
    bool isArabic = local == const Locale("ar") ? true : false;
    _saveLang(isArabic);
  }
}
