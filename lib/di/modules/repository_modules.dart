part of '../app_di.dart';

void _repositoryModulesInit() {
  locator
      .registerLazySingleton(() => RadioStationRepository(remote: locator()));

  locator.registerLazySingleton(() => ApiManagement(locator()));

  locator.registerLazySingleton(() => Dio());
}
