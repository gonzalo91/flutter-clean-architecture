import 'package:learning/core/_shared/api/secure_storage.dart';
import 'package:learning/core/_shared/constants.dart';
import 'package:learning/core/authentication/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final SecureStorage secureStorage;

  AuthenticationRepositoryImpl(this.secureStorage);

  @override
  Future<bool> verifyTokenInServer(token) async {
    final token = await secureStorage.get(Constants.AUTH_TOKEN_KEY);

    if (token == null) {
      return false;
    }

    return token.isNotEmpty;
  }

  @override
  Future<bool> logOut() async {
    await secureStorage.delete(Constants.AUTH_TOKEN_KEY);

    return Future.value(true);
  }
}
