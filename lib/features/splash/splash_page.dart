import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:restaurants/features/features.dart';
import 'package:restaurants/router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        // log('SplashPage: BlocListener: state: $state',
        //     name: 'SplashPage::build');
        // if (state is AuthenticationAuthenticated) {
        //   context.go(ScreenPaths.home);
        // }
        //
        // if (state is AuthenticationUnauthenticated) {
        //   context.go(ScreenPaths.login);
        // }
      },
      child: Container(),
    );
  }
}
