import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'radio_station_detail_state.dart';

class RadioStationDetailCubit extends Cubit<RadioStationDetailState> {
  RadioStationDetailCubit() : super(const RadioStationDetailState());
  final AudioPlayer audioPlayer = AudioPlayer();

  void init() {
    emit(state.copyWith(status: DetailPageStatus.success));
  }

  void playRadio(String url, bool isPlaying) async {
    emit(state.copyWith(status: DetailPageStatus.loading));

    try {
      await audioPlayer.play(UrlSource(url)).timeout(
            const Duration(seconds: 6),
          );
      emit(
        state.copyWith(isPlaying: isPlaying, status: DetailPageStatus.success),
      );
    } catch (error) {
      emit(
        state.copyWith(
            status: DetailPageStatus.error,
            isPlaying: false,
            errorMessage:
                'Ups... it seems there is a problem with the service. Try it later.'),
      );
      emit(
        state.copyWith(status: DetailPageStatus.initial),
      );
    }
  }

  void pauseRadio(bool isPlaying) async {
    emit(state.copyWith(status: DetailPageStatus.initial));
    emit(
        state.copyWith(isPlaying: isPlaying, status: DetailPageStatus.success));
    await audioPlayer.pause();
  }

  void stopRadio() async {
    await audioPlayer.stop();
  }

  void disposeAudioPlayer() {
    audioPlayer.dispose();
  }
}
