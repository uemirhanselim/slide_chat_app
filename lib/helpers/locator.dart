import 'package:get_it/get_it.dart';
import 'package:slide_chat_app/repository/auth_repository.dart';
import 'package:slide_chat_app/service/auth_service.dart';
import 'package:slide_chat_app/service/shared_preferences_services.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => SharedPreferencesServices());
}
