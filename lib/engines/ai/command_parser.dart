class CommandParser {
  static Map<String, dynamic> parse(String input) {
    final lower = input.toLowerCase().trim();

    if (lower.startsWith('open ')) {
      final target = lower.substring(5).trim();
      return {
        'intent': 'open_app',
        'target': target,
        'source': 'offline_parser',
        'requires_confirmation': false,
      };
    }

    if (lower.startsWith('search ')) {
      final query = lower.substring(7).trim();
      return {
        'intent': 'search',
        'query': query,
        'source': 'offline_parser',
        'requires_confirmation': false,
      };
    }

    return {
      'intent': 'unknown',
      'raw': input,
      'source': 'offline_parser',
      'requires_confirmation': true,
    };
  }
}