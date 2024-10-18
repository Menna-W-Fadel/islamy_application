import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
//keys for cache
  static const String themeModeKey = 'isDarkMode';
  static const String localeKey = 'locale';

  bool get isDark => appThemeMode == ThemeMode.dark;
  ThemeMode appThemeMode = ThemeMode.dark;
  String localeCode = "en";
  ThemeProvider() {
    loadSettings(); 
  }
  void changeThemeMode(ThemeMode themeMode) async {
    appThemeMode = themeMode;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeModeKey, appThemeMode == ThemeMode.dark);
  }

  void changeAppLocale(String localeLang) async {
    localeCode = localeLang;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(localeKey, localeCode);
  }

  // Load cached settings from SharedPreferences
  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isDarkMode = prefs.getBool(themeModeKey) ?? false;
    appThemeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

    localeCode = prefs.getString(localeKey) ?? "en";

    notifyListeners();
  }
}
