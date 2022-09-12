import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/app.dart';
import 'package:restaurants/constants/app_strings.dart';
import 'package:restaurants/features/features.dart';
import 'package:restaurants/shared/shared.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (BuildContext context) => RegisterBloc(
        authenticationRepository,
      ),
      child: const Scaffold(
        appBar: CustomAppbar(
          title: Text(AppStrings.authenticationRegisterAppBarTitle),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: RegisterButton(),
        body: RegisterForm(),
      ),
    );
  }
}
