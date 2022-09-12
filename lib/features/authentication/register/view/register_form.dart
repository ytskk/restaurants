import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:restaurants/constants/constants.dart';
import 'package:restaurants/features/features.dart';
import 'package:restaurants/shared/shared.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
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
      child: Form(
        key: context.read<RegisterBloc>().formKey,
        child: AutofillGroup(
          child: ListView(
            children: const [
              SizedBox(height: 32.0),
              _LoginInput(),
              Divider(),
              _PhoneInput(),
              Divider(),
              _EmailInput(),
              Divider(),
              _PasswordInput(),
              // const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginInput extends StatelessWidget {
  const _LoginInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          autofillHints: const [AutofillHints.newUsername],
          placeholder: AppStrings.authenticationRegisterLoginPlaceholder,
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterLoginChanged(value)),
          validator: (_) => state.login.error?.text,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          autofillHints: const [AutofillHints.telephoneNumber],
          placeholder: AppStrings.authenticationRegisterPhonePlaceholder,
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterPhoneChanged(value)),
          validator: (_) => state.phone.error?.text,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          autofillHints: const [AutofillHints.email],
          placeholder: AppStrings.authenticationRegisterEmailPlaceholder,
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterEmailChanged(value)),
          validator: (_) => state.email.error?.text,
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
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          autofillHints: const [AutofillHints.newPassword],
          placeholder: AppStrings.authenticationLoginPasswordPlaceholder,
          obscureText: true,
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterPasswordChanged(value)),
          validator: (_) => state.password.error?.text,
          keyboardType: TextInputType.visiblePassword,
        );
      },
    );
  }
}
