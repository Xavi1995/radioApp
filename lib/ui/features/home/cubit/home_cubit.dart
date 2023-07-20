import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:radio_app/core/constants/routing_constants.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';
import 'package:radio_app/data/api_management/repository/radio_station_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RadioStationRepository remote;
  HomeCubit({required this.remote}) : super(const HomeState());

  void getRadioStations() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final response = await remote.getRadioStations();

    if (response.isNotEmpty) {
      emit(state.copyWith(status: HomeStatus.success, radioList: response));
    } else {
      emit(
        state.copyWith(status: HomeStatus.error),
      );
    }
  }

  void onTapRadio(RadioStationEntity radioStation, BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteConstants.detailRadio,
      arguments:
          RadioStationEntity(url: radioStation.url, name: radioStation.name),
    );
  }
}
