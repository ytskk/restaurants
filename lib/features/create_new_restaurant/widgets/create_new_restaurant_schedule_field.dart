import 'package:flutter/material.dart';
import 'package:restaurants/shared/shared.dart';

import 'package:restaurants/constants/constants.dart';

class CreateNewRestaurantScheduleField extends StatelessWidget {
  const CreateNewRestaurantScheduleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            placeholder: AppStrings.createNewRestaurantScheduleFromPlaceholder,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomTextField(
            placeholder: AppStrings.createNewRestaurantScheduleToPlaceholder,
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
