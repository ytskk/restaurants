import 'dart:developer';

import 'package:formz/formz.dart';

enum EmailValidationError {
  empty(EmailValidationErrorText.empty);

  const EmailValidationError(this.text);

  final String text;
}

class EmailValidationErrorText {
  static const String empty = 'Поле не может быть пустым';
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.empty;
    }

    return null;
  }
}
