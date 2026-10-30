import 'package:flutter/material.dart';
import 'package:aura_launcher/widgets/app_grid.dart';
import 'package:aura_launcher/widgets/voice_assistant.dart';

class ThemedHomeScreen extends StatefulWidget {
  const ThemedHomeScreen({super.key});

  @override
  State<ThemedHomeScreen> createState() => _ThemedHomeScreenState();
}

class _ThemedHomeScreenState extends State<ThemedHomeScreen> {
  Color bgColor = Colors.black;
  Color accent = Colors.deepPurple;

  @override
  void initState() {
    super.initState();
    // Theme applied: Neon Cyber / Glass Aurora
    bgColor = const Color(0xFF090713);
    accent = const Color(0xFFA78BFA);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Aura Launcher',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: accent,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: accent.withOpacity(0.6),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(child: AppGrid()),
            const SizedBox(height: 10),
            const VoiceAssistantWidget(),
          ],
        ),
      ),
    );
  }
}