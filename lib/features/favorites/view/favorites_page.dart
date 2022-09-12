import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/app.dart';
import 'package:restaurants/features/favorites/cubit/favorites_cubit.dart';
import 'package:restaurants/shared/shared.dart';

import 'package:restaurants/constants/constants.dart';

import '../../features.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesCubit>(
      create: (context) =>
          FavoritesCubit(restaurantsRepository)..getFavorites(),
      child: Scaffold(
        appBar: const CustomAppbar(
          title: Text(AppStrings.favoritesAppBarTitle),
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoadInProgress) {
              return const Center(
                child: AdaptiveProgressIndicator(),
              );
            }

            if (state is FavoritesLoadSuccess) {
              final List<RestaurantModel> favorites = state.restaurants;

              if (favorites.isEmpty) {
                return const Center(
                  child: Text(AppStrings.favoritesEmptyListTitle),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 38.0,
                ),
                itemCount: state.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = favorites.elementAt(index);
                  return RestaurantCard(
                    restaurant: restaurant,
                    favouriteBuilder: (context) =>
                        FavoriteButton(restaurant: restaurant),
                  );
                },
              );
            }

            if (state is FavoritesLoadFailure) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
      ),
    );
  }
}
