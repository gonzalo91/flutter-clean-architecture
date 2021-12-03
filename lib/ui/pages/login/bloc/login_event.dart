part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class LoginButtonEvent extends LoginEvent{

    final String username;
    final String password;

  LoginButtonEvent(this.username, this.password);

}
