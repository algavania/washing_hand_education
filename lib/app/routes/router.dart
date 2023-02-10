// watch for file changes which will rebuild the generated files:
// flutter packages pub run build_runner watch

// only generate files once and exit after use:
// flutter packages pub run build_runner build

import 'package:auto_route/auto_route.dart';

import '../ui/screens.dart';

// watch for file changes which will rebuild the generated files:
// flutter packages pub run build_runner watch

// only generate files once and exit after use:
// flutter packages pub run build_runner build

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
        page: SplashPage,
        path: '/splash',
        initial: true,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: WelcomePage,
        path: '/welcome',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: CountingPage,
        path: '/counting',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: TutorialPage,
        path: '/tutorial',
        transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)
class $AppRouter {}
