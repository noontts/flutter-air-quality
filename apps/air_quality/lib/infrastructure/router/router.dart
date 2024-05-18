import 'package:air_quality/features/home/presentation/screen/home_screen.dart';
import 'package:air_quality/features/search/presentation/screen/search_screen.dart';
import 'package:go_router/go_router.dart';

final aqiRoute = <RouteBase>[
  GoRoute(
      path: 'search',
      builder: (context, state) {
        return const SearchScreen();
      })
];

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const Homepage();
      },
      routes: aqiRoute)
]);
