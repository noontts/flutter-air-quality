import 'package:air_quality/features/home/data/model/aqi_dto.dart';
import 'package:latlong2/latlong.dart';

abstract class IAQIRepository{
  Future<AQIDetailResponse> getAqiDetailByLatLng(LatLng latLng);
}