import 'package:dio/dio.dart';
import 'package:restaurants/features/features.dart';

abstract class RestaurantsRepositoryInterface {
  Future<List<RestaurantModel>> getRestaurants({
    int page = 1,
    int perPage = 10,
  });

  Future<RestaurantModel> getRestaurantDetails({
    required int id,
  });

  void authorize({
    required String accessToken,
    required String refreshToken,
  });

  Future<void> toggleFavourite({
    required RestaurantModel restaurant,
    required bool value,
  });

  Future<List<RestaurantModel>> getFavorites();
}
