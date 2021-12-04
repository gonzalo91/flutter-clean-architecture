import 'package:learning/core/authentication/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<bool> verifyTokenInServer(token) {
    return Future.value(true);
  }
}
