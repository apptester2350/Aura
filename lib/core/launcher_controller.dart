import 'package:flutter/material.dart';
import 'settings_manager.dart';
class LauncherController extends ChangeNotifier {
  bool _dark = true;
  bool get dark => _dark;
  Future<void> load() async {
    final s = SettingsManager();
    await s.init();
    _dark = await s.getBool('theme_dark', defaultVal: true);
    notifyListeners();
  }
  Future<void> toggleTheme() async {
    _dark = !_dark;
    final s = SettingsManager();
    await s.init();
    await s.setBool('theme_dark', _dark);
    notifyListeners();
  }
}
