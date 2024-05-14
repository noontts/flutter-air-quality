import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:flutter/material.dart';
import 'package:map/infrastructure/dependency_injection/inject.dart';
import 'package:map/infrastructure/router/router.dart';

void main() {
  registerCoreServices();
  registerMapService();
  runApp(const MapApp());
}

class MapApp extends StatelessWidget {
  const MapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
