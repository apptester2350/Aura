class IntentRouter {
  static Map<String, dynamic> route(Map<String, dynamic> intent) {
    final intentType = intent['intent'] ?? 'unknown';

    if (intentType == 'open_app') {
      return {
        'action': 'launch',
        'package': intent['target'],
        'confirmed': !intent['requires_confirmation'],
      };
    }

    if (intentType == 'search') {
      return {
        'action': 'search',
        'query': intent['query'],
      };
    }

    return {
      'action': 'unknown',
      'requires_confirmation': true,
    };
  }
}
