part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  final int tries;
  final bool loading;

  LoginLoading(this.tries, this.loading);
}

class LoginSuccess extends LoginState {}

class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
}
