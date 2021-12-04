import 'package:bloc/bloc.dart';
import 'package:learning/core/_shared/service.dart';
import 'package:learning/injection_container.dart' as ic;
import 'package:learning/core/authentication/authentication_service.dart';
import 'package:meta/meta.dart';

part 'root_event.dart';
part 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final AuthenticationService authenticationService =
      ic.sl<AuthenticationService>();

  RootBloc() : super(RootInitial()) {
    on<RootInitializeApp>((event, emit) async {
      var authModel = await authenticationService.call(NoParams());
      print(authModel.isAuthenticated);
      if (!authModel.isAuthenticated) {
        print('here 1');
        return emit(RootUnauthenticated());
      }

      if (!authModel.serverVerification) {
        print('here 2');
        return emit(RootLocalAuthenticated());
      }

      print('here 3');
      emit(RootAuthenticated());
    });

    on<RootCheckAuth>((event, emit) async {
      print('hola check auth');
    });
  }
}
