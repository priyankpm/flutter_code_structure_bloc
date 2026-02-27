import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_structure_bloc/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:project_structure_bloc/presentation/pages/home/home_screen.dart';
import 'package:project_structure_bloc/presentation/pages/login/login_screen.dart';
import 'package:project_structure_bloc/presentation/pages/onBoarding/onboarding_screen.dart';
import 'package:project_structure_bloc/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:project_structure_bloc/presentation/pages/splash/splash_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String homeScreen = '/homeScreen';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';

  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: splashScreen,
    routes: [
      commonRoute(child: const SplashScreen(), path: splashScreen),
      commonRoute(child: const OnboardingScreen(), path: onBoardingScreen),
      commonRoute(child: DashboardScreen(), path: dashboardScreen),
      commonRoute(child: const HomeScreen(), path: homeScreen),
      commonRoute(child: const LoginScreen(), path: loginScreen),
      commonRoute(child: const SignUpScreen(), path: signUpScreen),
    ],
  );
}

GoRoute commonRoute({
  required String path,
  required Widget child,
  Duration duration = const Duration(milliseconds: 300),
  Curve curve = Curves.easeInOut,
  Offset beginOffset = const Offset(1, 0), // Slide from right
}) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage(
      child: child,
      transitionsBuilder: slideRightTransition,
      transitionDuration: duration,
    ),
  );
}

Widget slideRightTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final tween = Tween<Offset>(
    begin: const Offset(1, 0),
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.linearToEaseOut));
  return SlideTransition(position: animation.drive(tween), child: child);
}

class AppNavigator {
  static GoRouter get _router => AppRoutes.router;

  static void go(String path, {dynamic extra}) {
    _router.go(path, extra: extra);
  }

  static void push(String path, {dynamic extra}) {
    _router.push(path, extra: extra);
  }

  static void pop({dynamic extra}) {
    _router.pop(extra);
  }
}
