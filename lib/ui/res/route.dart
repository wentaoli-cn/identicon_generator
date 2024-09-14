import 'package:go_router/go_router.dart';
import 'package:identicon_generator/ui/screens/home/home_screen.dart';
import 'package:identicon_generator/ui/screens/splash/splash_screen.dart';

enum Routez {
  splash(path: '/'),
  home(path: '/home');

  const Routez({required this.path});

  final String path;
}

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routez.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routez.home.path,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  initialLocation: Routez.splash.path,
  debugLogDiagnostics: true,
);
