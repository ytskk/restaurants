import 'package:fresh_dio/fresh_dio.dart';

enum UserAuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class AuthenticationRepositoryInterface {
  // /// Stream of [AuthenticationStatus] which will emit the current auth state.
  // Stream<AuthenticationStatus> get status async* {}
  Stream<AuthenticationStatus> get authenticationStatus;

  Future<dynamic> login({required String username, required String password});

  Future<void> logout();

  Future<dynamic> register({
    required String login,
    required String phone,
    required String email,
    required String password,
  });

  /// Close stream subscription.
  void dispose();

  Future getProfile();
}
