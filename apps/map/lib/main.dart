import 'package:flutter/material.dart';
import 'package:map/feature/map/presentation/screen/map_screen.dart';
import 'package:map/infrastructure/router/router.dart';

void main() {
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
