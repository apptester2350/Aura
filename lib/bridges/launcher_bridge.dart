import 'dart:convert';
import 'package:flutter/services.dart';

class LauncherBridge {
  static const MethodChannel _channel =
      MethodChannel('com.auralauncher/launcher');

  static Future<List<Map<String, dynamic>>> getInstalledApps() async {
    final result = await _channel.invokeMethod<List>('getInstalledApps');
    return List<Map<String, dynamic>>.from(result ?? []);
  }

  static Future<bool> requestHomeRole() async {
    final result = await _channel.invokeMethod<bool>('requestHomePermission');
    return result ?? false;
  }

  static Future<void> launchApp({String packageName = ''}) async {
    await _channel.invokeMethod('launchApp', {'packageName': packageName});
  }
}
