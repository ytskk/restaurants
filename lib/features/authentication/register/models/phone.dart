import 'dart:developer';

import 'package:formz/formz.dart';

enum PhoneValidationError {
  empty(PhoneValidationErrorText.empty),
  tooShort(PhoneValidationErrorText.tooShort);

  const PhoneValidationError(this.text);

  final String text;
}

class PhoneValidationErrorText {
  static const String empty = 'Поле не может быть пустым';
  static const String tooShort =
      'Номер телефона должен содержать ${PhoneValidationConstants.minLength} цифр';
}

class PhoneValidationConstants {
  static const int minLength = 11;
}

class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('');

  const Phone.dirty([super.value = '']) : super.dirty();

  @override
  PhoneValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PhoneValidationError.empty;
    }

    /// Clear phone number from all non-digit characters.
    final phone = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (phone.length < PhoneValidationConstants.minLength) {
      return PhoneValidationError.tooShort;
    }

    return null;
  }
}
