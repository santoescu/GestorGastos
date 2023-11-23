import 'package:flutter/material.dart';
import 'package:gestorgastos/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(String mode) {
    switch (mode) {
      case 'lightMode':
        themeData = lightMode;
        break;
      case 'greenMode':
        themeData = greenMode;
        break;
      case 'darkMode':
        themeData = darkMode;
        break;
    }
  }
}
