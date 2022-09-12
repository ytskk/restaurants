import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:restaurants/features/authentication/authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial()) {
    _authenticationStatusSubscription =
        _authenticationRepository.authenticationStatus.listen((status) {
      add(AuthenticationStatusChanged(status));
    });

    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
  }

  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;
  final AuthenticationRepositoryInterface _authenticationRepository;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    switch (event.status) {
      case AuthenticationStatus.authenticated:
        return emit(AuthenticationAuthenticated());
      case AuthenticationStatus.unauthenticated:
        return emit(AuthenticationUnauthenticated());
      case AuthenticationStatus.initial:
        return emit(AuthenticationInitial());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logout();
  }
}
