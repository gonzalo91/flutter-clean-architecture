import 'package:learning/core/_shared/api/secure_storage.dart';
import 'package:learning/core/_shared/constants.dart';
import 'package:learning/core/_shared/entities/user.dart';
import 'package:learning/core/_shared/repositories/save_user_data_locally.dart';

class SaveUserDataLocallyImpl implements SaveUserDataLocally {
  final SecureStorage secureStorage;

  SaveUserDataLocallyImpl(this.secureStorage);

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.put(Constants.AUTH_TOKEN_KEY, token);
  }

  @override
  Future<bool> saveUser(User user) {
    return Future.value(true);
  }
}
