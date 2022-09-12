import 'package:restaurants/features/features.dart';

main() {
  final List<String> phoneNumbers = [
    '+7 (999) 999-99-99',
    '7901999999',
    '8 904 231 55 81',
  ];

  for (String phoneNumber in phoneNumbers) {
    final Phone phone = Phone.dirty(phoneNumber);
    print(phone.validator(phone.value));
  }
}
