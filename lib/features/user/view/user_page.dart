import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/app.dart';
import 'package:restaurants/constants/app_strings.dart';
import 'package:restaurants/features/user/cubit/user_cubit.dart';
import 'package:restaurants/shared/shared.dart';

import 'package:restaurants/features/features.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserRepositoryInterface>(
      create: (context) => UserRepository(authenticationRepository),
      child: BlocProvider<UserCubit>(
        create: (context) => UserCubit(
          context.read<UserRepositoryInterface>(),
        )..getUser(),
        child: Scaffold(
          appBar: const CustomAppbar(
            title: Text(AppStrings.profileAppBarTitle),
          ),
          body: const UserBody(),
        ),
      ),
    );
  }
}
