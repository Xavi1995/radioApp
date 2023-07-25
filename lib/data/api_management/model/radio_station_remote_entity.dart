import 'package:json_annotation/json_annotation.dart';

part 'radio_station_remote_entity.g.dart';

@JsonSerializable(createToJson: false)
class RadioStationRemoteEntity {
  String? url;
  String? name;
  String? favicon;
  String? tags;

  RadioStationRemoteEntity(
      {required this.url,
      required this.name,
      required this.favicon,
      required this.tags});

  factory RadioStationRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$RadioStationRemoteEntityFromJson(json);
}
