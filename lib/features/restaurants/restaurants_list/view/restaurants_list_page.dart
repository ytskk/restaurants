import 'package:flutter/material.dart';
import 'package:restaurants/features/features.dart';
import 'package:restaurants/router.dart';

class RestaurantsListPage extends StatelessWidget {
  const RestaurantsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushNamed(
      //       ScreenPaths.createNewRestaurant,
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const RestaurantsListSliverAppBar(),
          ];
        },
        body: const RestaurantsListBody(),
      ),
    );
  }
}
