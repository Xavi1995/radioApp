part of 'radio_station_detail_cubit.dart';

enum DetailPageStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == DetailPageStatus.initial;
  bool get isSuccess => this == DetailPageStatus.success;
  bool get isLoading => this == DetailPageStatus.loading;
  bool get isError => this == DetailPageStatus.error;
}

class RadioStationDetailState extends Equatable {
  const RadioStationDetailState(
      {this.status = DetailPageStatus.initial,
      this.isPlaying = false,
      this.errorMessage = ''});
  final DetailPageStatus status;
  final bool isPlaying;
  final String errorMessage;

  @override
  List<Object?> get props => [status, isPlaying, errorMessage];

  RadioStationDetailState copyWith(
      {DetailPageStatus? status, bool? isPlaying, String? errorMessage}) {
    return RadioStationDetailState(
        status: status ?? this.status,
        isPlaying: isPlaying ?? this.isPlaying,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
