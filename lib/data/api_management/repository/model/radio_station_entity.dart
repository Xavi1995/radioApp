import 'package:equatable/equatable.dart';
import 'package:radio_app/data/api_management/model/radio_station_remote_entity.dart';

class RadioStationEntity extends Equatable {
  final String url;
  final String name;

  const RadioStationEntity({required this.url, required this.name});

  @override
  List<Object?> get props => [url, name];
}

extension RadioStationEntityExtensions on RadioStationRemoteEntity {
  RadioStationEntity toEntity() {
    return RadioStationEntity(url: url ?? '', name: name ?? '');
  }
}
