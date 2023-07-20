part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  success,
  loading,
  error;

  bool get isInitial => this == HomeStatus.initial;
  bool get isSuccess => this == HomeStatus.success;
  bool get isLoading => this == HomeStatus.loading;
  bool get isError => this == HomeStatus.error;
}

class HomeState extends Equatable {
  final List<RadioStationEntity> radioList;
  final HomeStatus status;

  const HomeState(
      {this.status = HomeStatus.initial,
      this.radioList = const <RadioStationEntity>[]});
  @override
  List<Object?> get props => [radioList, status];

  HomeState copyWith(
          {List<RadioStationEntity>? radioList, HomeStatus? status}) =>
      HomeState(
          status: status ?? this.status,
          radioList: radioList ?? this.radioList);
}
