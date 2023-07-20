import 'package:json_annotation/json_annotation.dart';

part 'radio_station_remote_entity.g.dart';

@JsonSerializable(createToJson: false)
class RadioStationRemoteEntity {
  String? url;
  String? name;

  RadioStationRemoteEntity({required this.url, required this.name});

  factory RadioStationRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$RadioStationRemoteEntityFromJson(json);
}
