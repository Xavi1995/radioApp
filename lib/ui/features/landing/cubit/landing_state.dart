part of 'landing_cubit.dart';

enum LandingStatus {
  initial,
  success,
  loading;

  bool get isInitial => this == LandingStatus.initial;
  bool get isSucces => this == LandingStatus.success;
  bool get isLoading => this == LandingStatus.loading;
}

class LandingState extends Equatable {
  const LandingState({this.status = LandingStatus.initial});
  final LandingStatus status;

  @override
  List<Object?> get props => [status];

  LandingState copyWith({LandingStatus? status}) {
    return LandingState(status: status ?? this.status);
  }
}
