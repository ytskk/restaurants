import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurants/data/api/api.dart';
import 'package:restaurants/features/features.dart';
import 'package:restaurants/router.dart';

import 'features/tmp/home.dart';
import 'shared/shared.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        authenticationRepository,
      ),
      child: MaterialApp(
        theme: AppThemeData.light,
        darkTheme: AppThemeData.dark,
        themeMode: ThemeMode.dark,
        navigatorKey: _navigatorKey,
        routes: {
          ScreenPaths.splash: (context) => const SplashPage(),
          ScreenPaths.home: (context) => HomeNavigationBuilder(
                builder: (BuildContext context, TabItem tabItem) {
                  if (tabItem == TabItem.restaurantsList) {
                    return const RestaurantsListPage();
                  }

                  if (tabItem == TabItem.favorites) {
                    return const FavoritesPage();
                  }

                  if (tabItem == TabItem.map) {
                    return const MapPage();
                  }

                  if (tabItem == TabItem.profile) {
                    return const UserPage();
                  }

                  return const RestaurantsListPage();
                },
              ),
          ScreenPaths.login: (context) => const LoginPage(),
          ScreenPaths.register: (context) => const RegisterPage(),
          ScreenPaths.restaurantDetails: (context) =>
              const RestaurantDetailsPage(),
          ScreenPaths.createNewRestaurant: (context) =>
              const CreateNewRestaurantPage(),
        },
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              log('AppView: BlocListener: state: $state',
                  name: 'AppView::build');
              if (state is AuthenticationAuthenticated) {
                // context.go(ScreenPaths.home);
                _navigator.pushNamedAndRemoveUntil(
                  ScreenPaths.home,
                  (route) => false,
                );
                return;
              }

              _navigator.pushNamedAndRemoveUntil(
                ScreenPaths.login,
                (route) => false,
              );
            },
            child: child,
          );
        },
      ),
    );
  }
}

void registerSingletons() {
  GetIt.I.registerSingleton<Dio>(
    ClientApi.dioWithInterceptors,
  );
  GetIt.I.registerSingleton<RestaurantsRepositoryInterface>(
    RestaurantsRepository(dio),
  );
  GetIt.I.registerSingleton<AuthenticationRepositoryInterface>(
    AuthenticationRepository(
      dio,
      restaurantsRepository,
    ),
  );
}

Dio get dio => GetIt.I<Dio>();
AuthenticationRepositoryInterface get authenticationRepository =>
    GetIt.I<AuthenticationRepositoryInterface>();
RestaurantsRepositoryInterface get restaurantsRepository =>
    GetIt.I<RestaurantsRepositoryInterface>();
