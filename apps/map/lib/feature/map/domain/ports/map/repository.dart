import 'package:latlong2/latlong.dart';

import '../../../data/model/marker_dto.dart';

abstract class IMapRepository {
  Future<MarkerResponse> getMarkerByBounds(LatLng latLng1, LatLng latLng2);
}