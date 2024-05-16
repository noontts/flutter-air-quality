import 'package:air_quality/features/home/presentation/screen/home_screen.dart';
import 'package:air_quality/infrastructure/dependency_injection/inject.dart';
import 'package:flutter/material.dart';

void main() {
  registerAQIService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}