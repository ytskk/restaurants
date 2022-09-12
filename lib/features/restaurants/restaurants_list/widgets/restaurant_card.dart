import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurants/features/features.dart';
import 'package:restaurants/router.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.restaurant,
    this.favouriteBuilder,
  }) : super(key: key);

  final RestaurantModel restaurant;
  final Widget Function(BuildContext)? favouriteBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ScreenPaths.restaurantDetails,
            arguments: restaurant,
          );
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (restaurant.images.isNotEmpty)
              _RestaurantCardTop(
                restaurant: restaurant,
              ),
              _RestaurantCardBottom(
                restaurant: restaurant,
                favouriteBuilder: favouriteBuilder,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RestaurantCardTop extends StatelessWidget {
  const _RestaurantCardTop({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'restaurant_${restaurant.id}_image',
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        // TODO: delete tmp image url
        child: Image.network(
          restaurant.images.isEmpty
              ? 'https://loremflickr.com/640/640'
              : restaurant.images.first.url,
          height: 150.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _RestaurantCardBottom extends StatelessWidget {
  const _RestaurantCardBottom({
    Key? key,
    required this.restaurant,
    this.favouriteBuilder,
  }) : super(key: key);

  final RestaurantModel restaurant;
  final Widget Function(BuildContext)? favouriteBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.title,
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        restaurant.description,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 13.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        restaurant.coords.addressName,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 13.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (favouriteBuilder != null) favouriteBuilder!(context),
        ],
      ),
    );
  }
}
