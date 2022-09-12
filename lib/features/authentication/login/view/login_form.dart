import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurants/constants/constants.dart';
import 'package:restaurants/features/authentication/authentication.dart';
import 'package:restaurants/router.dart';
import 'package:restaurants/shared/shared.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.error!),
              ),
            );
        }
      },
      child: Center(
        child: Form(
          key: context.read<LoginBloc>().formKey,
          child: AutofillGroup(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _UsernameInput(),
                const Divider(),
                const _PasswordInput(),
                const SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      _LoginButton(),
                      SizedBox(height: 16.0),
                      _RegisterButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (BuildContext context, state) {
        return CustomTextField(
          autofillHints: const [AutofillHints.username, AutofillHints.email],
          placeholder: AppStrings.authenticationLoginLoginOrEmailPlaceholder,
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(value)),
          validator: (_) => state.username.error?.text,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (BuildContext context, state) {
        return CustomTextField(
          autofillHints: const [AutofillHints.password],
          placeholder: AppStrings.authenticationLoginPasswordPlaceholder,
          obscureText: true,
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(value)),
          validator: (_) => state.password.error?.text,
          keyboardType: TextInputType.visiblePassword,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (BuildContext context, state) {
        return CustomButton(
          onPressed: !state.status.isSubmissionInProgress
              ? () {
                  context.read<LoginBloc>().formKey.currentState?.validate();
                  if (state.status.isValidated) {
                    context.read<LoginBloc>().add(const LoginSubmitted());
                  }
                }
              : null,
          child: const Text(AppStrings.authenticationLoginLoginButtonTitle),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      child: Text(
        AppStrings.authenticationLoginRegisterButtonTitle,
      ),
      onPressed: () {
        // context.push(ScreenPaths.register);
        Navigator.of(context).pushNamed(ScreenPaths.register);
      },
    );
  }
}
