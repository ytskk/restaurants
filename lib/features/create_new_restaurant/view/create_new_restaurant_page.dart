import 'package:flutter/material.dart';
import 'package:restaurants/constants/app_strings.dart';
import 'package:restaurants/features/features.dart';
import 'package:restaurants/shared/shared.dart';

class CreateNewRestaurantPage extends StatelessWidget {
  const CreateNewRestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(AppStrings.createNewRestaurantAppBarTitle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CreateNewRestaurantSubmitButton(),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          const CreateNewRestaurantForm(),
        ],
      ),
    );
  }
}
