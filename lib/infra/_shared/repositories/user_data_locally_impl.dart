import 'package:learning/core/_shared/api/local_storage.dart';
import 'package:learning/core/_shared/api/secure_storage.dart';
import 'package:learning/core/_shared/constants.dart';
import 'package:learning/core/_shared/entities/user.dart';
import 'package:learning/core/_shared/errors/failures.dart';
import 'package:learning/core/_shared/repositories/user_data_locally.dart';

class UserDataLocallyImpl implements UserDataLocally {
  final SecureStorage secureStorage;
  final LocalStorage localStorage;

  UserDataLocallyImpl(this.secureStorage, this.localStorage);

  @override
  Future<User> getUser() async {
    var userString = await localStorage.get(Constants.LOCAL_USER_KEY);

    if (userString == null || userString.isEmpty) {
      throw UserNotFound();
    }

    return User.fromLocal(userString);
  }

  @override
  Future<bool> saveUser(User user) async {
    var userString = user.toLocal();

    await localStorage.put(Constants.LOCAL_USER_KEY, userString);

    return Future.value(true);
  }

  @override
  Future<String> getToken() async {
    var token = await secureStorage.get(Constants.AUTH_TOKEN_KEY);

    if (token == null || token.isEmpty) {
      throw AuthTokenNotFound();
    }

    return token;
  }

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.put(Constants.AUTH_TOKEN_KEY, token);
  }

  @override
  Future<void> deleteUserData() async {
    await secureStorage.delete(Constants.AUTH_TOKEN_KEY);

    await localStorage.delete(Constants.LOCAL_USER_KEY);
  }
}
