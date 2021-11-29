

import 'dart:convert';

import 'package:learning/core/_shared/api/http_client.dart';
import 'package:learning/core/_shared/api/network_info.dart';
import 'package:learning/core/_shared/entities/user.dart';
import 'package:learning/core/_shared/entities/user_schedule.dart';
import 'package:learning/core/user_login/user_login_repository.dart';

class UserLoginRepositoryImpl implements UserLoginRepository{
    
  final NetworkInfo networkInfo;
  final HttpClient httpClient;

  UserLoginRepositoryImpl(this.networkInfo, this.httpClient);

  @override
  Future<User> login(String username, String password) async {

    if(! await networkInfo.isConnected){
      //Throw Failure
    }

    var response = await httpClient.get('posts/1', {
      'username' : username,
      'password' : password,
    });

    print(json.decode(response.body)['title']);
            
    return Future.value(
      User(1, 'Zalo', 'zaluuser', 1, 'asdasdkjsahdkjsa', <UserSchedule>[])
    );

  }
    
}