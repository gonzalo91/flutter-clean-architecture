import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'root_event.dart';
part 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc() : super(RootInitial()) {
    on<RootInitializeApp>((event, emit) async {
      await Future.delayed(Duration(seconds: 2), () {
        print("Execute this code afer 2 seconds");
      });
      emit(RootUnauthenticated());
    });
  }
}
