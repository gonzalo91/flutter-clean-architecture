import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial( )) {    
    on<LoginButtonEvent>((event, emit) async {
      await _addToValue(1, emit);
      print('event2!' + event.username);
    });
  }

  Future<void> _addToValue(int toAdd, Emitter <LoginState> emit) async {
    print(state);
    if(state is LoginInitial){      
      emit(LoginLoading( 1, true) );
    }
    
    if(state is LoginLoading){      
      emit(LoginLoading((state as LoginLoading).tries + 1, true));
    }
    
    await Future.delayed(Duration(seconds: 2), () {
          print("Execute this code afer 2 seconds");
        });    

    emit(LoginLoading(0, false));
    


  }
  
}
