import 'package:calc/assets/constants.dart';
import 'package:calc/assets/theme_data.dart';
import 'package:flutter/cupertino.dart';

class SettingVM extends ChangeNotifier {
  String currentMode = darkModeKey;
  ModeData currentThemeData = DarkModeData();
  void changeCurrentMode() {
    if (currentMode == darkModeKey) {
      currentMode = lightModeKey;
      currentThemeData = DarkModeData();
    } else {
      currentMode = darkModeKey;
      currentThemeData = LightModeData();
    }
    notifyListeners();
  }
}
