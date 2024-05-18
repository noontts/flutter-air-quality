import 'package:air_quality/features/home/presentation/screen/home_screen.dart';
import 'package:air_quality/infrastructure/dependency_injection/inject.dart';
import 'package:air_quality/infrastructure/router/router.dart';
import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  registerCoreServices();
  registerAQIService();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
