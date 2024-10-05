import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planets/presentation/pages/home/home.dart';
import 'package:planets/presentation/pages/info.planet/info.planet.dart';
import 'package:planets/presentation/pages/planets/planets.dart';
import 'package:planets/routes/router.names.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: RouteNames.home,
      routes: [
        GoRoute(
          path: RouteNames.home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: RouteNames.planets,
          builder: (context, state) => const PlanetsPage(),
        ),
        GoRoute(
            name: RouteNames.planets,
            path: "${RouteNames.planets}/:name",
            builder: (context, state) {
              return InfoPlanetPage(
                name: state.pathParameters['name']!,
              );
            }),
      ],
      redirectLimit: 5,
      redirect: (context, state) async {
        final currentRoute = state.matchedLocation;

        if (currentRoute == "/") {
          return RouteNames.home;
        }

        if (currentRoute != "/") {
          return currentRoute;
        }

        return null;
      });
});
