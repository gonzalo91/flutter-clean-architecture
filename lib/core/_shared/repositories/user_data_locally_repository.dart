import 'package:learning/core/_shared/entities/user.dart';

abstract class UserDataLocallyRepository {
  Future<User> getUser();

  Future<bool> saveUser(User user);

  Future<void> saveToken(String token);

  Future<String> getToken();

  Future<void> deleteUserData();
}
