import 'package:learning/core/_shared/service.dart';
import 'package:learning/core/_shared/constants.dart';
import 'package:learning/core/_shared/api/network_info.dart';
import 'package:learning/core/_shared/api/secure_storage.dart';
import 'package:learning/core/authentication/authentication_repository.dart';

class AuthenticationService implements Service<AuthenticationModel, NoParams> {
  final NetworkInfo networkInfo;
  final SecureStorage secureStorage;
  final AuthenticationRepository authenticationRepository;

  AuthenticationService(
      this.networkInfo, this.secureStorage, this.authenticationRepository);

  @override
  Future<AuthenticationModel> call(params) async {
    var token = await secureStorage.get(Constants.AUTH_TOKEN_KEY);

    if (token == null) {
      return AuthenticationModel(false, false);
    }

    if (!(await networkInfo.isConnected)) {
      return AuthenticationModel(true, false);
    }

    if (!(await authenticationRepository.verifyTokenInServer(token))) {
      return AuthenticationModel(false, false);
    }

    return AuthenticationModel(true, true);
  }

  Future<bool> logOut() {
    return authenticationRepository.logOut();
  }
}

class AuthenticationModel {
  final bool isAuthenticated;
  final bool serverVerification;

  AuthenticationModel(this.isAuthenticated, this.serverVerification);
}
