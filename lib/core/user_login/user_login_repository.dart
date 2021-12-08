import 'package:learning/core/_shared/entities/user.dart';

abstract class UserLoginRepository {
  Future<void> login(String username, String password);
}
