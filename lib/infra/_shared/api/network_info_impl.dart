
import 'dart:developer' as developer;
import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:learning/core/_shared/api/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {  


  @override
  Future<bool> get isConnected => DataConnectionChecker().hasConnection;        
  
}