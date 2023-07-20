import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'radio_station_detail_state.dart';

class RadioStationDetailCubit extends Cubit<RadioStationDetailState> {
  RadioStationDetailCubit() : super(const RadioStationDetailState());
  final audioPlayer = AudioPlayer();
  void init() {
    emit(state.copyWith(status: DetailPageStatus.success));
  }

  void playRadio(String url) async {
    await audioPlayer.play(UrlSource(url));
  }

  void pauseRadio() async {
    await audioPlayer.pause();
  }

  void stopRadio() async {
    await audioPlayer.stop();
  }

  void disposeAudioPlayer() {
    audioPlayer.dispose();
  }
}
