import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:shared_preferences.dart';

class Theme {
  final String templateId;
  final String name;
  final String category;
  final int version;
  final Map<String, dynamic> style;
  final Map<String, dynamic> layout;
  final Map<String, dynamic> animation;
  final bool isCustom;

  Theme({
    required this.templateId,
    required this.name,
    required this.category,
    this.version = 1,
    required this.style,
    required this.layout,
    required this.animation,
    this.isCustom = false,
  });

  Theme.fromJson(Map<String, dynamic> json)
      : templateId = json['template_id'] ?? '',
        name = json['name'] ?? '',
        category = json['category'] ?? '',
        version = json['version'] ?? 1,
        style = (json['style'] ?? {}) as Map<String, dynamic>,
        layout = (json['layout'] ?? {}) as Map<String, dynamic>,
        animation = (json['animation'] ?? {}) as Map<String, dynamic>,
        isCustom = json['isCustom'] ?? false;
}

class ThemeEngine {
  static const MethodChannel _channel =
      MethodChannel('com.auralauncher/theme');

  static Future<Theme> loadTheme(String templateId) async {
    final data = await rootBundle.loadString(
        'assets/themes/$templateId.json');
    return Theme.fromJson(jsonDecode(data) as Map<String, dynamic>);
  }

  static Future<List<Theme>> getAvailableThemes() async {
    final indexData = await rootBundle.loadString('assets/themes/index.json');
    final index = jsonDecode(indexData) as List;
    return index
        .map((e) => Theme.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<bool> saveThemeSelection(String themeId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('active_theme', themeId);
    return true;
  }

  static Future<String?> getActiveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('active_theme');
  }

  static Future<void> importTheme(Map<String, dynamic> jsonData) async {
    final encoder = JsonEncoder();
    await File('assets/themes/imported.json').writeAsString(
      encoder.convert(jsonData),
    );
  }
}
