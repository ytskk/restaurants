import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty(PasswordValidationErrorText.empty),
  tooShort(PasswordValidationErrorText.tooShort),
  ;

  const PasswordValidationError(this.text);

  final String text;
}

class PasswordValidationErrorText {
  static const String empty = 'Поле не может быть пустым';
  static const String tooShort =
      'Пароль должен быть не менее ${PasswordValidationConstants.minLength} символов';
}

class PasswordValidationConstants {
  static const int minLength = 8;
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < PasswordValidationConstants.minLength) {
      return PasswordValidationError.tooShort;
    }

    return null;
  }
}
