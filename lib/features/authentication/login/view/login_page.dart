import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/app.dart';
import 'package:restaurants/constants/constants.dart';
import 'package:restaurants/features/authentication/authentication.dart';
import 'package:restaurants/shared/shared.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: Text(AppStrings.authenticationLoginAppBarTitle),
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          authenticationRepository,
        ),
        child: const LoginForm(),
      ),
    );
  }
}
