import 'package:get_it/get_it.dart';
import 'package:learning/config/app_config.dart';
import 'package:learning/core/_shared/api/http_client.dart';
import 'package:learning/core/_shared/api/network_info.dart';
import 'package:learning/core/_shared/api/local_storage.dart';
import 'package:learning/core/_shared/api/secure_storage.dart';
import 'package:learning/core/user_login/user_login_service.dart';
import 'package:learning/infra/_shared/api/http_client_impl.dart';
import 'package:learning/infra/_shared/api/network_info_impl.dart';
import 'package:learning/infra/_shared/api/local_storage_impl.dart';
import 'package:learning/infra/_shared/api/secure_storage_impl.dart';
import 'package:learning/core/user_login/user_login_repository.dart';
import 'package:learning/infra/user_login/data/login_datasource.dart';
import 'package:learning/core/authentication/authentication_service.dart';
import 'package:learning/infra/user_login/user_login_repository_impl.dart';
import 'package:learning/core/authentication/authentication_repository.dart';
import 'package:learning/infra/_shared/repositories/user_data_locally_impl.dart';
import 'package:learning/infra/authentication/authentication_repository_impl.dart';
import 'package:learning/core/_shared/repositories/user_data_locally_repository.dart';

//service Locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<UserDataLocallyRepository>(
      () => UserDataLocallyImpl(sl(), sl()));

  //! Core - Shared -> api
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton<HttpClient>(() => HttpClientImpl());
  sl.registerLazySingleton<SecureStorage>(() => SecureStorageImpl());
  sl.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());

  // Features - UserLogin
  sl.registerLazySingleton(() => LoginDataSource());
  sl.registerLazySingleton<UserLoginRepository>(
      () => UserLoginRepositoryImpl(sl(), sl(), sl()));
  sl.registerFactory(() => UserLoginService(sl()));

  // Features - Authentication
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()));
  sl.registerFactory(() => AuthenticationService(sl(), sl(), sl()));

  // Data sources

  //! Config
  sl.registerLazySingleton(() => AppConfig());

  //! External
  //final sharedPreferences = await SharedPreferences.getInstance();
}
