import 'package:learning/core/_shared/service.dart';
import 'package:learning/core/user_login/user_login_repository.dart';

class UserLoginService
    implements Service<GeneralReturnTypeService, UserLoginParams> {
  final UserLoginRepository userLoginRepository;

  UserLoginService(this.userLoginRepository);

  @override
  Future<GeneralReturnTypeService> call(UserLoginParams params) async {
    try {
      await userLoginRepository.login(params.username, params.password);

      return GeneralReturnTypeService.noValue(false, '');
    } on Exception catch (e) {
      return GeneralReturnTypeService.noValue(true, e.toString());
    }
  }
}

class UserLoginParams {
  final String username;
  final String password;

  UserLoginParams(this.username, this.password);
}
