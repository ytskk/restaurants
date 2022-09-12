import 'package:restaurants/features/features.dart';

abstract class UserRepositoryInterface {
  Future<UserModel> getUser();
  Future<UserModel> updateUser(UserModel user);
  Future<void> logout();
}
