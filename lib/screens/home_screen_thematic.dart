import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aura_launcher/widgets/app_grid.dart';
import 'package:aura_launcher/widgets/voice_assistant.dart';
import 'package:aura_launcher/engines/theme_engine.dart';
import 'package:aura_launcher/core/launcher_controller.dart';

class ThemedHomeScreen extends StatefulWidget {
  const ThemedHomeScreen({super.key});

  @override
  State<ThemedHomeScreen> createState() => _ThemedHomeScreenState();
}

class _ThemedHomeScreenState extends State<ThemedHomeScreen> {
  Theme? activeTheme;

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  Future<void> loadTheme() async {
    final theme = await ThemeEngine.loadTheme('theme_001_neon_cyber');
    if (mounted) {
      setState(() {
        activeTheme = theme;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.watch<LauncherController>().dark;
    final bgColor = dark ? const Color(0xFF090713) : const Color(0xFFF5F5F5);
    final accent = dark ? const Color(0xFFA78BFA) : Colors.deepPurple;

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
