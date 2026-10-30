import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/launcher_controller.dart';
import 'core/lifecycle/performance_controller.dart';
import 'screens/home_screen.dart';
class AuraLauncherApp extends StatelessWidget {
  const AuraLauncherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PerformanceController()),
        ChangeNotifierProvider(create: (_) => LauncherController()..load()),
      ],
      child: MaterialApp(
        title: 'Aura Launcher',
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}
