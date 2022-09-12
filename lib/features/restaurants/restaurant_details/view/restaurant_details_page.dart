import 'dart:developer';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:restaurants/constants/constants.dart';
import 'package:restaurants/features/features.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: replace with request!
    final restaurant =
        ModalRoute.of(context)!.settings.arguments as RestaurantModel;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          log('is innerBoxIsScrolled: $innerBoxIsScrolled');
          return [
            RestaurantDetailsSliverAppbar(
              restaurant: restaurant,
              innerBoxIsScrolled: innerBoxIsScrolled,
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.only(top: 0.0),
          children: [
            _RestaurantDescription(
              restaurant: restaurant,
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
            ),
            _RestaurantInfo(
              restaurant: restaurant,
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantDescription extends StatelessWidget {
  const _RestaurantDescription({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.restaurantDetailsDescriptionTitle,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 13.0,
            ),
          ),
          const SizedBox(height: 4.0),
          ExpandableText(
            restaurant.description,
            expandText: AppStrings.restaurantDetailsDescriptionExpandText,
            collapseText: AppStrings.restaurantDetailsDescriptionCollapseText,
            maxLines: 2,
            linkEllipsis: false,
            animation: true,
            animationDuration: const Duration(milliseconds: 300),
            animationCurve: Curves.easeOut,
            linkStyle: theme.textTheme.bodySmall!.copyWith(
              color: theme.colorScheme.primary,
              fontSize: 13.0,
              decoration: TextDecoration.underline,
            ),
            linkColor: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _RestaurantInfo extends StatelessWidget {
  const _RestaurantInfo({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 16.0,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ],
          ),
          horizontalTitleGap: 0,
          title: Text(
            '${AppStrings.restaurantDetailsWorkingHoursTitle} с ${restaurant.schedule.opening} до ${restaurant.schedule.closing}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          ),
        ),
        ListTile(
          dense: true,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16.0,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ],
          ),
          horizontalTitleGap: 0,
          title: Text(
            restaurant.coords.addressName,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          ),
        ),
      ],
    );
  }
}
