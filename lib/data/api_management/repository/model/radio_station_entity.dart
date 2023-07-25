import 'package:equatable/equatable.dart';
import 'package:radio_app/data/api_management/model/radio_station_remote_entity.dart';

class RadioStationEntity extends Equatable {
  final String url;
  final String name;
  final String favicon;
  final String tags;

  const RadioStationEntity(
      {required this.url,
      required this.name,
      required this.favicon,
      required this.tags});

  @override
  List<Object?> get props => [url, name];
}

extension RadioStationEntityExtensions on RadioStationRemoteEntity {
  RadioStationEntity toEntity() {
    String? cleanedName;

    if (name != null) {
      cleanedName = name!.replaceAll(' ', '');
    }

    return RadioStationEntity(
        url: url ?? '',
        name: cleanedName ?? '',
        favicon: favicon ?? '',
        tags: tags ?? '');
  }
}
