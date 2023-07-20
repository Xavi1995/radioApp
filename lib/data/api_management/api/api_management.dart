import 'package:dio/dio.dart';
import 'package:radio_app/data/api_management/api_constants/api_constants.dart';
import 'package:radio_app/data/api_management/model/radio_station_remote_entity.dart';
import 'package:retrofit/http.dart';

part 'api_management.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiManagement {
  factory ApiManagement(Dio dio, {String baseUrl}) = _ApiManagement;

  @GET('/json/stations')
  Future<List<RadioStationRemoteEntity>> getRadiosStations();
}
