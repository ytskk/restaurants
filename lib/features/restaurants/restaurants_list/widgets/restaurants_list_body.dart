import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurants/app.dart';
import 'package:restaurants/features/features.dart';

class RestaurantsListBody extends StatefulWidget {
  const RestaurantsListBody({Key? key}) : super(key: key);

  @override
  _RestaurantsListBodyState createState() => _RestaurantsListBodyState();
}

class _RestaurantsListBodyState extends State<RestaurantsListBody> {
  static const _pageSize = 10;

  final PagingController<int, RestaurantModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await restaurantsRepository.getRestaurants(
          page: pageKey, perPage: _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<RestaurantModel>(
          itemBuilder: (context, item, index) => RestaurantCard(
            restaurant: item,
            favouriteBuilder: (context) => FavoriteButton(
              restaurant: item,
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20.0);
        },
      ),
    );
  }
}

/// Changes status on UI and sends request to server.
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    required this.restaurant,
    this.color,
  }) : super(key: key);

  final RestaurantModel restaurant;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    StreamController<bool> _streamController = StreamController<bool>();

    return StreamBuilder<bool>(
        stream: _streamController.stream,
        initialData: restaurant.isFavourite,
        builder: (context, snapshot) {
          return IconButton(
            icon: Icon(
              snapshot.data != null && snapshot.data == true
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: snapshot.data != null && snapshot.data == true
                  ? theme.colorScheme.error
                  : color ?? theme.colorScheme.onBackground,
            ),
            onPressed: () {
              restaurantsRepository.toggleFavourite(
                  restaurant: restaurant, value: !snapshot.data!);
              _streamController.add(!snapshot.data!);
            },
          );
        });
  }
}
