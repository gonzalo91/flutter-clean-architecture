import 'package:learning/core/_shared/api/network_info.dart';
import 'package:learning/core/_shared/errors/failures.dart';
import 'package:learning/core/_shared/repositories/user_data_locally.dart';
import 'package:learning/core/user_login/user_login_repository.dart';
import 'package:learning/infra/user_login/data/login_datasource.dart';

class UserLoginRepositoryImpl implements UserLoginRepository {
  final NetworkInfo networkInfo;
  final LoginDataSource dataSource;
  final UserDataLocally saveUserDataLocally;

  UserLoginRepositoryImpl(
      this.networkInfo, this.dataSource, this.saveUserDataLocally);

  @override
  Future<void> login(String username, String password) async {
    if (!await networkInfo.isConnected) {
      throw NoNetworkConnection();
    }

    var response = await dataSource.login(username, password);

    await saveUserDataLocally.saveToken(response.token);

    await saveUserDataLocally.saveUser(response.user);
  }
}
