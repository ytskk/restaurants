import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:restaurants/constants/constants.dart';
import 'package:restaurants/features/features.dart';
import 'package:restaurants/shared/shared.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButton(
            onPressed: !state.status.isSubmissionInProgress
                ? () {
                    context
                        .read<RegisterBloc>()
                        .formKey
                        .currentState
                        ?.validate();
                    if (state.status.isValidated) {
                      context
                          .read<RegisterBloc>()
                          .add(const RegisterSubmitted());
                    }
                  }
                : null,
            child:
                Text(AppStrings.authenticationRegisterCreateAccountButtonTitle),
          ),
        );
      },
    );
  }
}
