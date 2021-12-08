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
      await _verifyAuth(emit);
    });

    on<RootCheckAuth>((event, emit) async {
      await _verifyAuth(emit);
    });

    on<RootLogOutEvent>((event, emit) async {
      var hasBeenLoggedOut = await authenticationService.logOut();

      if (hasBeenLoggedOut) {
        emit(RootLogOut());
      }
    });
  }

  Future<void> _verifyAuth(emit) async {
    var authModel = await authenticationService.call(NoParams());

    if (!authModel.isAuthenticated) {
      return emit(RootUnauthenticated());
    }

    if (!authModel.serverVerification) {
      return emit(RootLocalAuthenticated());
    }

    emit(RootAuthenticated());
  }
}
