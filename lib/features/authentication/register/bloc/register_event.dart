part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterLoginChanged extends RegisterEvent {
  const RegisterLoginChanged(this.login);

  final String login;

  @override
  List<Object?> get props => [login];
}

class RegisterPhoneChanged extends RegisterEvent {
  const RegisterPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object?> get props => [phone];
}

class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();

  @override
  List<Object?> get props => [];
}
