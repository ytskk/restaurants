import 'package:flutter/material.dart';
import 'package:restaurants/constants/app_strings.dart';
import 'package:restaurants/shared/shared.dart';

class CreateNewRestaurantTitleField extends StatelessWidget {
  const CreateNewRestaurantTitleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      placeholder: AppStrings.createNewRestaurantNamePlaceholder,
      textInputAction: TextInputAction.next,
    );
  }
}
