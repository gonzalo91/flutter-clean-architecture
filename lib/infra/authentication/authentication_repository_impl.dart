import 'package:learning/core/_shared/errors/failures.dart';
import 'package:learning/core/authentication/authentication_repository.dart';
import 'package:learning/core/_shared/repositories/user_data_locally_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final UserDataLocallyRepository userDataLocally;

  AuthenticationRepositoryImpl(this.userDataLocally);

  @override
  Future<bool> verifyTokenInServer(token) async {
    try {
      var token = await userDataLocally.getToken();

      return token.isNotEmpty;
    } on AuthTokenNotFound catch (_) {
      return false;
    }
  }

  @override
  Future<bool> logOut() async {
    await userDataLocally.deleteUserData();

    return Future.value(true);
  }
}
