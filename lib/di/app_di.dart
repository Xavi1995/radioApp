import 'package:dio/dio.dart';
import 'package:radio_app/data/api_management/api/api_management.dart';
import 'package:radio_app/data/api_management/repository/radio_station_repository.dart';
import 'package:radio_app/di/locator.dart';
import 'package:radio_app/ui/features/detail/cubit/radio_station_detail_cubit.dart';
import 'package:radio_app/ui/features/home/cubit/home_cubit.dart';
import 'package:radio_app/ui/features/landing/cubit/landing_cubit.dart';

part 'modules/ui_modules_di.dart';
part 'modules/repository_modules.dart';

void init() {
  _uiCubitDiInit();
  _repositoryModulesInit();
}
