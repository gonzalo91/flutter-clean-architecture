part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginAttemptEvent extends LoginEvent {
  final String username;
  final String password;

  LoginAttemptEvent(this.username, this.password);
}
