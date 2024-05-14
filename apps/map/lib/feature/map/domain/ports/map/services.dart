import 'package:flutter_map/flutter_map.dart';

abstract class IMapService {
  Future<List<Marker>> getMarkerByBounds(LatLngBounds bounds);
}
