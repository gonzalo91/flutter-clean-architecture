import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:learning/injection_container.dart' as ic;
import 'package:learning/core/_shared/api/network_info.dart';

part 'network_info_event.dart';
part 'network_info_state.dart';


class NetworkInfoBloc extends Bloc<NetworkInfoEvent, NetworkInfoState> {
  final NetworkInfo networkInfoImpl = ic.sl<NetworkInfo>();

  NetworkInfoBloc() : super(NetworkInfoState(true)) {
    
    on<CheckNetworkInfoEvent>((event, emit) async {

        var isConnected = await networkInfoImpl.isConnected;
        
        emit(NetworkInfoState(isConnected));
        
    });
  }

  
}
