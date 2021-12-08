import 'package:bloc/bloc.dart';
import 'package:learning/core/_shared/entities/user.dart';
import 'package:learning/core/_shared/repositories/user_data_locally.dart';
import 'package:meta/meta.dart';
import 'package:learning/injection_container.dart' as ic;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserDataLocally userDataLocallyRepo = ic.sl<UserDataLocally>();

  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadingEvent>((event, emit) async {
      emit(HomeUserState(await userDataLocallyRepo.getUser()));
    });
  }
}
