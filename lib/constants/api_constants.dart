class ApiConstants {
  const ApiConstants._();

  // auth
  static const String baseUrl = 'http://188.225.83.80:6719/api/v1/';
  static const String getProfile = 'auth/login/profile';
  static const String authorization = 'auth/login';
  static const String register = 'auth/registration/customer/new';
  static const String refreshToken = 'auth/login/refresh';

  //  restaurants
  static const String getAllRestaurants = 'restaurants/all';
  static const String addRestaurantToFavourites = 'likes/new';
  static const String deleteRestaurantFromFavourites = 'likes/';
  static const String createNewRestaurant = 'restaurants/new';

  // favorites
  static const String favorites = 'likes/all';
}
