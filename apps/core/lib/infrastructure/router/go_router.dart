import 'package:air_quality/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:map/feature/map/presentation/screen/map_screen.dart';
import '../../layout/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorProfileKey =
GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

final router =
GoRouter(initialLocation: '/', navigatorKey: _rootNavigatorKey, routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(navigatorKey: _shellNavigatorHomeKey, routes: [
          GoRoute(
              path: '/',
              pageBuilder: (context, state) =>
              const NoTransitionPage(child: Homepage()),
              routes: []
          ),
        ]),
        StatefulShellBranch(navigatorKey: _shellNavigatorProfileKey, routes: [
          GoRoute(
            path: '/map',
            pageBuilder: (context, state) =>
            const NoTransitionPage(child: MapScreen()),
          )
        ])
      ])
]);