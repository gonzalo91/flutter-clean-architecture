import 'package:learning/core/_shared/entities/user_schedule.dart';
import 'package:learning/core/_shared/entities/user.dart';

abstract class SaveUserDataLocally {
  Future<bool> saveUser(User user);

  Future<void> saveToken(String token);
}
