import 'package:flutter/material.dart';
import 'package:restaurants/constants/app_strings.dart';
import 'package:restaurants/shared/shared.dart';

class CreateNewRestaurantSubmitButton extends StatelessWidget {
  const CreateNewRestaurantSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      child: Text(AppStrings.createNewRestaurantCreateButtonTitle),
    );
  }
}
