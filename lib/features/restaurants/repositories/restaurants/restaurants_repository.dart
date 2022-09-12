import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:restaurants/data/data.dart';
import 'package:restaurants/features/features.dart';

import 'package:restaurants/constants/constants.dart';

class RestaurantsRepository implements RestaurantsRepositoryInterface {
  RestaurantsRepository(Dio api) : _api = api..interceptors.add(_fresh);

  final Dio _api;
  static final _fresh = Fresh.oAuth2(
    tokenStorage: SecureTokenStorage(const FlutterSecureStorage()),
    shouldRefresh: (response) {
      return response?.statusCode == 401;
    },
    refreshToken: (token, client) async {
      client.options.baseUrl = ApiConstants.baseUrl;
      log('RestaurantsRepository: _fresh: refreshToken: tokens: ${token?.refreshToken}');

      client.options.validateStatus = (statusCode) {
        if (statusCode == null) {
          return false;
        }
        if (statusCode == 422) {
          return true;
        } else {
          return statusCode >= 200 && statusCode < 500;
        }
      };
      client.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          log('onRequest: ${options.method} ${options.path}, ${options.data}');

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          log('onResponse: ${response.statusCode} ${response.statusMessage}');

          return handler.next(response);
        },
        onError: (DioError error, ErrorInterceptorHandler handler) {
          log('onError: ${error.response?.statusCode} ${error.response?.data['error'].toString()}');

          return handler.next(error);
        },
      ));

      final response = await client.post(
        ApiConstants.refreshToken,
        data: {'refreshToken': token?.refreshToken},
      );
      log('RestaurantsRepository: _fresh: refreshToken: response: $response');
      return OAuth2Token(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );
    },
  );

  @override
  Future<List<RestaurantModel>> getRestaurants(
      {int page = 1, int perPage = 10}) async {
    // await _fresh.revokeToken();
    final Response<Map<String, dynamic>> res = await _api.get(
      ApiConstants.getAllRestaurants,
      queryParameters: {
        'page': page,
        'perPage': perPage,
      },
    );

    if (res.data?['status'] == 422) {
      throw NetworkException(res.data?['message']);
    }

    final List<dynamic> restaurants = res.data!['restaurants'];

    return restaurants.map((e) => RestaurantModel.fromJson(e)).toList();
  }

  @override
  Future<RestaurantModel> getRestaurantDetails({required int id}) {
    // TODO: implement getRestaurantDetails
    throw UnimplementedError();
  }

  @override
  Future<void> authorize({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _fresh.setToken(
      OAuth2Token(
        accessToken: accessToken,
        refreshToken: refreshToken,
      ),
    );
  }

  Future _addRestaurantToFavourites({
    required int id,
  }) async {
    final Response<Map<String, dynamic>> res = await _api.post(
      ApiConstants.addRestaurantToFavourites,
      data: {
        'restaurant_id': id,
      },
    );

    if (res.data?['status'] == 422) {
      throw NetworkException(res.data?['message']);
    }
  }

  Future _removeRestaurantFromFavourites({
    required int id,
  }) async {
    final Response<Map<String, dynamic>> res = await _api.delete(
      '${ApiConstants.deleteRestaurantFromFavourites}/$id',
    );

    if (res.data?['status'] == 422) {
      throw NetworkException(res.data?['message']);
    }
  }

  @override
  Future<void> toggleFavourite({
    required RestaurantModel restaurant,

    /// toggle to this value
    bool? value,
  }) async {
    if (value != null) {
      if (value) {
        return await _addRestaurantToFavourites(id: restaurant.id);
      }
      return await _removeRestaurantFromFavourites(id: restaurant.id);
    }

    if (restaurant.isFavourite) {
      return await _removeRestaurantFromFavourites(id: restaurant.id);
    } else {
      return await _addRestaurantToFavourites(id: restaurant.id);
    }
  }

  @override
  Future<List<RestaurantModel>> getFavorites() async {
    final Response<Map<String, dynamic>> res = await _api.get(
      ApiConstants.favorites,
    );

    if (res.data?['status'] == 422) {
      throw NetworkException(res.data?['message']);
    }

    final List<dynamic> restaurants = res.data!['restaurants'];

    return restaurants.map((e) => RestaurantModel.fromJson(e)).toList();
  }
}
