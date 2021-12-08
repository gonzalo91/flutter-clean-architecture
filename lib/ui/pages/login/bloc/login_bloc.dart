import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learning/core/_shared/errors/failures.dart';
import 'package:learning/core/user_login/user_login_service.dart';
import 'package:meta/meta.dart';
import 'package:learning/injection_container.dart' as ic;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserLoginService userLoginService = ic.sl<UserLoginService>();

  LoginBloc() : super(LoginInitial()) {
    on<LoginAttemptEvent>((event, emit) async {
      emit(LoginLoading(1, true));

      try {
        var response = await userLoginService
            .call(UserLoginParams(event.username, event.password));

        if (response.error) {
          return emit(LoginFailureState(response.errorMessage));
        }

        emit(LoginSuccess());
      } on Exception catch (error) {
        emit(LoginFailureState(error.toString()));
      } catch (_) {
        emit(LoginFailureState(_.toString()));
      }
    });
  }
}
