import 'package:learning/core/_shared/repositories/save_user_data_locally.dart';
import 'package:learning/core/_shared/service.dart';
import 'package:learning/core/_shared/entities/user.dart';
import 'package:learning/core/user_login/user_login_repository.dart';

class UserLoginService implements Service<User, UserLoginParams>{

  final UserLoginRepository userLoginRepository;
  final SaveUserDataLocally saveUserDataLocally;

  UserLoginService(this.userLoginRepository, this.saveUserDataLocally);
  
  @override
  Future<User> call(UserLoginParams params) async {    
    var userLogin = await userLoginRepository.login(params.username, params.password);

    saveUserDataLocally.save(userLogin);

    return userLogin;
  }

}

class UserLoginParams {

    final String username;
    final String password;

    UserLoginParams(this.username, this.password);
}