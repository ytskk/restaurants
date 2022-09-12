import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurants/data/api/api.dart';
import 'package:restaurants/features/features.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._userRepository) : super(const UserInitial());

  final UserRepositoryInterface _userRepository;

  Future<void> getUser() async {
    // TODO: load user on refresh, not always.
    emit(const UserLoadInProgress());
    try {
      final user = await _userRepository.getUser();
      emit(UserLoadSuccess(user));
      log('userdata: $user');
    } on NetworkException catch (e) {
      emit(UserLoadFailure(e.message));
    }
  }

  Future<void> logout() async {
    await _userRepository.logout();
  }
}
