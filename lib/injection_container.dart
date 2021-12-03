
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:learning/config/app_config.dart';
import 'package:learning/core/_shared/api/http_client.dart';
import 'package:learning/core/_shared/api/network_info.dart';
import 'package:learning/core/_shared/repositories/save_user_data_locally.dart';
import 'package:learning/core/user_login/user_login_repository.dart';
import 'package:learning/core/user_login/user_login_service.dart';
import 'package:learning/infra/_shared/api/http_client_impl.dart';
import 'package:learning/infra/_shared/api/network_info_impl.dart';
import 'package:learning/infra/_shared/repositories/save_user_data_locally_impl.dart';
import 'package:learning/infra/user_login/user_login_repository_impl.dart';

//service Locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<SaveUserDataLocally>(() => SaveUserDataLocallyImpl());

  //! Core - Shared -> api
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton<HttpClient>(() => HttpClientImpl());
  
  // Features - UserLogin
  sl.registerLazySingleton<UserLoginRepository>(() => UserLoginRepositoryImpl(sl(), sl())); 
  sl.registerFactory(() => UserLoginService(sl(), sl()));     
  
  // Repository
  

  // Data sources
  

  //! Config
  sl.registerLazySingleton(() => AppConfig());

  //! External
  //final sharedPreferences = await SharedPreferences.getInstance();
  //sl.registerLazySingleton(() => sharedPreferences);
  //sl.registerLazySingleton(() => http.Client());
  //sl.registerLazySingleton(() => DataConnectionChecker());
}
