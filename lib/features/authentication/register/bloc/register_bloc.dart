import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:restaurants/data/api/api.dart';
import 'package:restaurants/features/authentication/authentication.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._authenticationRepository) : super(const RegisterState()) {
    on<RegisterLoginChanged>(_onLoginChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  final AuthenticationRepositoryInterface _authenticationRepository;
  final formKey = GlobalKey<FormState>();

  void _onLoginChanged(
    RegisterLoginChanged event,
    Emitter<RegisterState> emit,
  ) {
    final login = Login.dirty(event.login);
    emit(
      state.copyWith(
        login: login,
        status:
            Formz.validate([login, state.phone, state.email, state.password]),
      ),
    );
  }

  void _onPhoneChanged(
    RegisterPhoneChanged event,
    Emitter<RegisterState> emit,
  ) {
    final phone = Phone.dirty(event.phone);
    emit(
      state.copyWith(
        phone: phone,
        status:
            Formz.validate([state.login, phone, state.email, state.password]),
      ),
    );
  }

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status:
            Formz.validate([state.login, state.phone, email, state.password]),
      ),
    );
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status:
            Formz.validate([state.login, state.phone, state.email, password]),
      ),
    );
  }

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    log('RegisterBloc: _onSubmitted: state: $state');
    if (!state.status.isValidated) return;

    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        error: null,
      ),
    );
    try {
      await _authenticationRepository.register(
        login: state.login.value,
        phone: state.phone.value,
        email: state.email.value,
        password: state.password.value,
      );
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          error: null,
        ),
      );
    } on NetworkException catch (e) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          error: e.message,
        ),
      );
    }
  }
}
