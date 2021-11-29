

import 'package:learning/core/_shared/entities/user.dart';

abstract class UserLoginRepository{
    
    Future<User> login(String username, String password);
    
}