import 'package:formz/formz.dart';

enum UsernameValidationError {
  empty(UsernameValidationErrorText.empty);

  const UsernameValidationError(this.text);

  final String text;
}

class UsernameValidationErrorText {
  static const String empty = 'Поле не может быть пустым';
}

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : UsernameValidationError.empty;
  }
}