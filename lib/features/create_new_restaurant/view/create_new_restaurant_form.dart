import 'package:flutter/material.dart';

import 'package:restaurants/features/features.dart';

class CreateNewRestaurantForm extends StatelessWidget {
  const CreateNewRestaurantForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: const [
          CreateNewRestaurantTitleField(),
          SizedBox(height: 16),
          CreateNewRestaurantAddressField(),
          SizedBox(height: 16),
          CreateNewRestaurantScheduleField(),
          SizedBox(height: 16),
          CreateNewRestaurantDescriptionField(),
        ],
      ),
    );
  }
}
