import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurants/app.dart';
import 'package:restaurants/features/features.dart';
import 'package:restaurants/features/tmp/home.dart';

abstract class ScreenPaths {
  static String splash = '/';
  static String home = '/restaurants';
  static String login = '/login';
  static String register = '/register';
  static String restaurantDetails = '/restaurants/details';
  static String map = '/map';
  static String createNewRestaurant = '/restaurants/new';
}

final appRouter = GoRouter(
  initialLocation: ScreenPaths.splash,
  routes: [
    AppRoute(
        path: ScreenPaths.splash, builder: (context) => const SplashPage()),
    AppRoute(
      path: ScreenPaths.home,
      builder: (_) => const Home(),
    ),
    AppRoute(
      path: ScreenPaths.login,
      builder: (_) => const LoginPage(),
    ),
    AppRoute(
      path: ScreenPaths.register,
      builder: (_) => const RegisterPage(),
    ),
  ],
);

class AppRoute extends GoRoute {
  AppRoute({
    required super.path,
    Widget Function(GoRouterState s)? builder,
  }) : super(
          pageBuilder: (context, state) {
            if (Platform.isAndroid) {
              return MaterialPage(
                child: builder!(state),
              );
            } else {
              return CupertinoPage(
                child: builder!(state),
              );
            }
          },
        );
}
