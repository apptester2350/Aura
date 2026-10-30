class SpeechService {
  static bool isAvailable() => true;

  static Future<String> listen() async {
    return 'Hello';
  }

  static Future<void> speak(String text) async {
    // TTS implementation
  }
}
