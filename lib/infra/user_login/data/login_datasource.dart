import 'package:learning/infra/user_login/failures.dart';
import 'package:learning/core/_shared/entities/user.dart';

class LoginDataSource {
  Future<LoginModel> login(String user, String password) {
    if (user != 'user' || password != '1234') {
      throw LoginAttemptFailure();
    }

    var json = {
      'token': 'ABCD1234',
      'user': {
        'id': 1,
        'name': 'User Name',
        'username': 'user',
        'uuid': '123e4567-e89b-12d3-a456-426614174000',
      }
    };

    return Future.value(LoginModel.fromJson(json));
  }
}

class LoginModel {
  final String token;
  final User user;

  LoginModel(this.token, this.user);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    var user = json['user'];
    return LoginModel(
      json['token'],
      User((user['id'] as int), user['name'], user['username'], user['uuid']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "user": {
        'name': user.name,
        'id': user.id,
      },
    };
  }
}
