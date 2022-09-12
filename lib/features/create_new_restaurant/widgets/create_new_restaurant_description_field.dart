import 'package:flutter/material.dart';

import 'package:restaurants/shared/shared.dart';

import 'package:restaurants/constants/constants.dart';

class CreateNewRestaurantDescriptionField extends StatelessWidget {
  const CreateNewRestaurantDescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      placeholder: AppStrings.createNewRestaurantDescriptionPlaceholder,
      maxLines: 5,
    );
  }
}
