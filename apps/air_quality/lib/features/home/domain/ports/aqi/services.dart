import 'package:air_quality/features/home/domain/entities/aqi.dart';
import 'package:latlong2/latlong.dart';

abstract class IAQIService {
  Future<AqiToDisplay> getAqiDetailByLatLng(LatLng latLng);
  Future<AqiToDisplay> getAqiDetailById(int id);
  Future<AqiToDisplay> getAqiDetailByIP();
}