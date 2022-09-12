import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constants/app_strings.dart';
import 'package:restaurants/features/user/cubit/user_cubit.dart';
import 'package:restaurants/shared/shared.dart';

class UserBody extends StatelessWidget {
  const UserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<UserCubit, UserState>(
      builder: (BuildContext context, state) {
        if (state is UserLoadInProgress) {
          return const Center(
            child: AdaptiveProgressIndicator(),
          );
        }

        if (state is UserLoadSuccess) {
          return Center(
            child: Column(
              children: [
                const SizedBox(height: 38.0),
                Text(
                  state.user.nickname,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  state.user.email,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 28.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.surface,
                    foregroundColor: theme.colorScheme.error,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 22.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  onPressed: () {
                    context.read<UserCubit>().logout();
                  },
                  child: const Text(AppStrings.profileLogoutButtonTitle),
                ),
              ],
            ),
          );
        }

        if (state is UserLoadFailure) {
          return const Center(
            child: Text('Error'),
          );
        }

        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
