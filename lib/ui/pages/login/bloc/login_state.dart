part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
  final int counter = 0;
  final bool loading = false;

  LoginInitial();  
}

class LoginLoading extends LoginState {
  final int tries;
  final bool loading;

  LoginLoading(this.tries, this.loading);

  
}





