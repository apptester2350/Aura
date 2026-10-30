import 'package:flutter/material.dart';

class PerformanceController extends ChangeNotifier {
  bool _isLowMemory = false;
  bool _batterySaver = false;
  bool _isPaused = false;
  bool _themeDark = true;

  bool get isLowMemory => _isLowMemory;
  bool get batterySaver => _batterySaver;
  bool get isPaused => _isPaused;
  bool get themeDark => _themeDark;

  void setBatterySaver(bool value) {
    _batterySaver = value;
    notifyListeners();
  }

  void setLowMemory(bool value) {
    _isLowMemory = value;
    notifyListeners();
  }

  void setPaused(bool value) {
    _isPaused = value;
    notifyListeners();
  }

  void setThemeDark(bool value) {
    _themeDark = value;
    notifyListeners();
  }
}
