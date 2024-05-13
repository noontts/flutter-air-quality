import 'package:go_router/go_router.dart';
import 'package:map/feature/map/presentation/screen/map_screen.dart';

final mapRoutes = <RouteBase>[
];

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const MapScreen();
      },
      routes: mapRoutes)
]);