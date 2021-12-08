part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeUserState extends HomeState {
  final User user;

  HomeUserState(this.user);
}
