import 'package:flutter/material.dart';
import 'package:restaurants/features/features.dart';

class RestaurantDetailsSliverAppbar extends StatelessWidget {
  const RestaurantDetailsSliverAppbar({
    Key? key,
    required this.restaurant,
    required this.innerBoxIsScrolled,
  }) : super(key: key);

  final RestaurantModel restaurant;
  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      actions: [
        FavoriteButton(
          restaurant: restaurant,
          color: innerBoxIsScrolled
              ? theme.colorScheme.onBackground
              : Colors.white,
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            innerBoxIsScrolled ? theme.colorScheme.onBackground : Colors.white,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      toolbarTextStyle: theme.textTheme.labelMedium!.copyWith(
        color:
            innerBoxIsScrolled ? theme.colorScheme.onBackground : Colors.white,
      ),
      title: Text(
        restaurant.title,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: innerBoxIsScrolled
                  ? theme.colorScheme.onBackground
                  : Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
      ),
      pinned: true,
      centerTitle: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          children: [
            Hero(
              tag: 'restaurant_${restaurant.id}_image',
              child: Image.network(
                restaurant.images.isEmpty
                    ? 'https://loremflickr.com/640/640'
                    : restaurant.images.first.url,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            //  gradient
            Container(
              // height: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
