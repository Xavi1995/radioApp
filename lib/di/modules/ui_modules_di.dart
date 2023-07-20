part of '../app_di.dart';

void _uiCubitDiInit() {
  locator.registerLazySingleton(() => HomeCubit(remote: locator()));
  locator.registerLazySingleton(() => LandingCubit());
  locator.registerLazySingleton(() => RadioStationDetailCubit());
}
