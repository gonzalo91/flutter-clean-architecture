abstract class AuthenticationRepository {
  Future<bool> verifyTokenInServer(token);

  Future<bool> logOut();
}
