import 'package:flutter_map/flutter_map.dart';
import 'package:map/feature/map/domain/entities/marker.dart';

abstract class IMapService {
  Future<List<MarkerDisplay>> getMarkerByBounds(LatLngBounds bounds);
}
