import 'command_parser.dart';

class OfflineAIEngine {
  static Future<Map<String, dynamic>> processCommand(String input) async {
    final result = CommandParser.parse(input);
    return result;
  }
}