import 'package:learning/core/_shared/entities/user.dart';
import 'package:learning/core/_shared/repositories/save_user_data_locally.dart';

class SaveUserDataLocallyImpl implements SaveUserDataLocally{

  @override
  Future<bool> saveData(User user){

    return Future.value(true);
  }

}