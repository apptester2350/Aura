import 'package:flutter/material.dart';
import '../engines/ai/speech_service.dart';
import '../engines/ai/offline_ai_engine.dart';
import '../engines/ai/intent_router.dart';

class VoiceAssistantWidget extends StatefulWidget {
  const VoiceAssistantWidget({super.key});

  @override
  State<VoiceAssistantWidget> createState() => _VoiceAssistantWidgetState();
}

class _VoiceAssistantWidgetState extends State<VoiceAssistantWidget> {
  String resultText = 'বলুন...';
  bool isListening = false;

  Future<void> _listenAndProcess() async {
    setState(() => isListening = true);
    final spoken = await SpeechService.listen();
    final parsed = await OfflineAIEngine.processCommand(spoken);
    final routed = IntentRouter.route(parsed);
    setState(() {
      resultText = '${parsed['intent']} → ${routed['action']}';
      isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          IconButton(
            iconSize: 48,
            icon: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
            onPressed: _listenAndProcess,
          ),
          const SizedBox(height: 8),
          Text(
            resultText,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}