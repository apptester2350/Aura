import 'package:shared_preferences/shared_preferences.dart';
class SettingsManager {
  static final _i = SettingsManager._internal();
  factory SettingsManager() => _i;
  SettingsManager._internal();
  SharedPreferences? _p;
  Future<void> init() async => _p ??= await SharedPreferences.getInstance();
  Future<bool> getBool(String k, {bool d=false}) async { await init(); return _p!.getBool(k)??d; }
  Future<void> setBool(String k, bool v) async { await init(); await _p!.setBool(k, v); }
  Future<String> getString(String k, {String d=''}) async { await init(); return _p!.getString(k)??d; }
  Future<void> setString(String k, String v) async { await init(); await _p!.setString(k, v); }
}
