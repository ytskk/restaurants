import 'package:restaurants/features/features.dart';

class UserRepository implements UserRepositoryInterface {
  UserRepository(this._authenticationRepository);

  final AuthenticationRepositoryInterface _authenticationRepository;

  @override
  Future<UserModel> getUser() async {
    final user = await _authenticationRepository.getProfile();

    return user;
  }

  @override
  Future<UserModel> updateUser(UserModel user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await _authenticationRepository.logout();
  }
}
