import 'dart:convert';
import 'package:flutter/services.dart';

class WidgetBridge {
  static const MethodChannel _channel =
      MethodChannel('com.auralauncher/widget');

  static Future<int> createWidgetHost() async {
    final result = await _channel.invokeMethod<int>('allocateAppWidgetId');
    return result ?? 0;
  }

  static Future<List<String>> getWidgetProviders() async {
    final result = await _channel.invokeMethodList('getInstalledProviders');
    return List<String>.from(result ?? []);
  }

  static Future<bool> bindWidget(int id) async {
    final result = await _channel.invokeMethod<bool>('bindWidget', {'id': id});
    return result ?? false;
  }

  static Future<bool> updateLayout(int id, int w, int h) async {
    final result = await _channel.invokeMethod<bool>('updateLayout',
        {'id': id, 'width': w, 'height': h});
    return result ?? false;
  }
}
