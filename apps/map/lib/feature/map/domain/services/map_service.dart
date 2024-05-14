import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/feature/map/domain/entities/marker.dart';
import 'package:map/feature/map/domain/ports/map/repository.dart';
import 'package:map/feature/map/domain/ports/map/services.dart';

import '../../presentation/widget/marker_pm.dart';

class MapService extends IMapService {
  final IMapRepository repository = getIt.get<IMapRepository>();

  @override
  Future<List<Marker>> getMarkerByBounds(LatLngBounds bounds) async {
    final rawResponse =
        await repository.getMarkerByBounds(bounds.southWest, bounds.northEast);

    var listMarker = <Marker>[];

    final listMarkerDisplay = rawResponse.data!
        .map((marker) => MarkerDisplay(
            lat: marker.lat!,
            lon: marker.lon!,
            aqi: int.parse(marker.aqi!),
            name: marker.station!.name!))
        .toList();

    for (final e in listMarkerDisplay) {
      listMarker.add(Marker(
          width: 70,
          height: 70,
          point: LatLng(e.lat, e.lon),
          child: MarkerPM25(
            pm: e.aqi,
            latLng: LatLng(e.lat, e.lon),
            name: e.name
          )));
    }

    return listMarker;
  }
}
