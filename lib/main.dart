import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: HealthyCashApp()));
}

class HealthyCashApp extends StatelessWidget {
  const HealthyCashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthyCash reload ',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
