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
  const RadioStationDetailState({this.status = DetailPageStatus.initial});
  final DetailPageStatus status;
  @override
  List<Object?> get props => [status];

  RadioStationDetailState copyWith({DetailPageStatus? status}) {
    return RadioStationDetailState(status: status ?? this.status);
  }
}
