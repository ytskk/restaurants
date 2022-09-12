import 'package:formz/formz.dart';

enum LoginValidationError {
  empty(LoginValidationErrorText.empty);

  const LoginValidationError(this.text);

  final String text;
}

class LoginValidationErrorText {
  static const String empty = 'Поле не может быть пустым';
}

class Login extends FormzInput<String, LoginValidationError> {
  const Login.pure() : super.pure('');

  const Login.dirty([super.value = '']) : super.dirty();

  @override
  LoginValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : LoginValidationError.empty;
  }
}
