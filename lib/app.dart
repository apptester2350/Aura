import 'package:flutter/material.dart';
import 'package:aura_launcher/screens/home_screen.dart';

class AuraLauncherApp extends StatelessWidget {
  const AuraLauncherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aura Launcher',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}