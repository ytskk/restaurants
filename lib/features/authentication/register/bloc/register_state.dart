part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.login = const Login.pure(),
    this.phone = const Phone.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.error,
  });

  final FormzStatus status;
  final Login login;
  final Phone phone;
  final Email email;
  final Password password;
  final String? error;

  RegisterState copyWith({
    FormzStatus? status,
    Login? login,
    Phone? phone,
    Email? email,
    Password? password,
    String? error,
  }) {
    return RegisterState(
      status: status ?? this.status,
      login: login ?? this.login,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, login, phone, email, password, error];
}
