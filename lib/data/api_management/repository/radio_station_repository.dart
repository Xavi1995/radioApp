import 'package:radio_app/data/api_management/api/api_management.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';

class RadioStationRepository {
  final ApiManagement remote;

  RadioStationRepository({required this.remote});

  Future<List<RadioStationEntity>> getRadioStations() async {
    final result = await remote.getRadiosStations();

    try {
      return result.map((e) => e.toEntity()).toList();
    } catch (error) {
      throw Exception(error);
    }
  }
}
