import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  String langCode = "en";

  changeTheme(ThemeMode themeMode) {
    appTheme = themeMode;
    notifyListeners();
  }

  changeLanguage(BuildContext context, String code) {
    context.setLocale(Locale(code));
    notifyListeners();
  }
}
