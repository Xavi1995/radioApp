import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(const LandingState());

  void init() async {
    emit(state.copyWith(status: LandingStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: LandingStatus.success));
  }

  void goToHomePage(BuildContext context) {}
}
