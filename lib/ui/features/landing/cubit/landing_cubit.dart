import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:radio_app/core/constants/routing_constants.dart';
import 'package:radio_app/di/locator.dart';
import 'package:radio_app/ui/features/home/cubit/home_cubit.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(const LandingState());

  void init() async {
    emit(state.copyWith(status: LandingStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(status: LandingStatus.success));
  }

  void goToHomePage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, RouteConstants.home, (route) => false);
  }
}
