import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:restaurants/constants/constants.dart';
import 'package:restaurants/data/api/api.dart';
import 'package:restaurants/features/features.dart';

class AuthenticationRepository extends AuthenticationRepositoryInterface {
  AuthenticationRepository(Dio api, this._restaurantsRepository)
      : _api = api..interceptors.add(_fresh);

  final Dio _api;
  // TODO: make di.
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final RestaurantsRepositoryInterface _restaurantsRepository;

  @override
  Stream<AuthenticationStatus> get authenticationStatus =>
      _fresh.authenticationStatus;

  static final _fresh = Fresh.oAuth2(
    tokenStorage: SecureTokenStorage(const FlutterSecureStorage()),
    shouldRefresh: (response) {
      return response?.statusCode == 401;
    },
    refreshToken: (token, client) async {
      log('AuthenticationRepository: _fresh: refreshToken: tokens: ${token?.refreshToken}');
      final response = await client.post(
        ApiConstants.refreshToken,
        data: {'refreshToken': token?.refreshToken},
      );
      log('AuthenticationRepository: _fresh: refreshToken: response: $response');
      return OAuth2Token(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );
    },
  );

  @override
  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    final Response<Map<String, dynamic>> res = await _api.post(
      ApiConstants.authorization,
      data: {
        emailOrLogin(username): username,
        'password': password,
      },
    );

    if (res.data?['status'] == 422) {
      throw NetworkException(res.data?['message']);
    }

    final tokens = res.data!['tokens'];
    final user = res.data!['user'];

    await _fresh.setToken(
      OAuth2Token(
        accessToken: tokens['accessToken'],
        refreshToken: tokens['refreshToken'],
      ),
    );

    _restaurantsRepository.authorize(
      accessToken: tokens['accessToken'],
      refreshToken: tokens['refreshToken'],
    );

    return res;
  }

  @override
  Future<void> logout() async {
    await _fresh.setToken(null);
    return await _fresh.revokeToken();
  }

  @override
  Future register({
    required String login,
    required String phone,
    required String email,
    required String password,
  }) async {
    log(
      'registering with data: $login, $phone, $email, $password',
      name: 'AuthenticationRepository::register',
    );
    final res = await _api.post(
      ApiConstants.register,
      data: {
        'nickname': login,
        'phone': phone,
        'email': email,
        'password': password,
      },
    );

    log('res: ${res.data}');

    if (res.data['status'] == 422) {
      throw NetworkException(res.data['message']);
    }

    final tokens = res.data['tokens'];
    final user = res.data['user'];

    await _fresh.setToken(
      OAuth2Token(
        accessToken: tokens['accessToken'],
        refreshToken: tokens['refreshToken'],
      ),
    );

    _restaurantsRepository.authorize(
      accessToken: tokens['accessToken'],
      refreshToken: tokens['refreshToken'],
    );
  }

  @override
  Future<UserModel> getProfile() async {
    final res = await _api.get(ApiConstants.getProfile);
    final user = UserModel.fromJson(res.data);

    return user;
  }

  @override
  void dispose() {
    _fresh.close();
  }
}

String emailOrLogin(String username) {
  // TODO: dumb implementation
  if (username.contains('@') && username.contains('.')) {
    return 'email';
  } else {
    return 'login';
  }
}

class SecureTokenStorage implements TokenStorage<OAuth2Token> {
  SecureTokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<OAuth2Token?> read() async {
    final accessToken = await _storage.read(key: 'accessToken');
    final refreshToken = await _storage.read(key: 'refreshToken');

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    return OAuth2Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  Future<void> write(OAuth2Token? token) async {
    if (token == null) {
      await _storage.delete(key: 'accessToken');
      await _storage.delete(key: 'refreshToken');
    } else {
      await _storage.write(key: 'accessToken', value: token.accessToken);
      await _storage.write(key: 'refreshToken', value: token.refreshToken);
    }
  }

  @override
  Future<void> delete() {
    return write(null);
  }
}
