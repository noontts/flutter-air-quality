import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map/feature/map/domain/entities/marker.dart';
import 'package:map/feature/map/domain/ports/map/repository.dart';
import 'package:map/feature/map/domain/ports/map/services.dart';

class MapService extends IMapService {
  final IMapRepository repository = getIt.get<IMapRepository>();

  @override
  Future<List<MarkerDisplay>> getMarkerByBounds(LatLngBounds bounds) async {
    final rawResponse =
        await repository.getMarkerByBounds(bounds.southWest, bounds.northEast);

    return rawResponse.data!
        .map((marker) => MarkerDisplay(
            lat: marker.lat!,
            lon: marker.lon!,
            aqi: marker.aqi == '-' ? 0 : int.parse(marker.aqi!),
            name: marker.station!.name!))
        .toList();
  }
}
