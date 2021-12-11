import 'package:learning/core/_shared/api/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected => InternetConnectionChecker().hasConnection;
}
