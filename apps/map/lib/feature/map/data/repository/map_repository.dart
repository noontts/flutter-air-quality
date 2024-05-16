import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:core_libs/networks/http/http_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/feature/map/data/model/marker_dto.dart';
import 'package:map/feature/map/domain/ports/map/repository.dart';

class MapRepository implements IMapRepository {
  final HttpService httpService = getIt.get<HttpService>();
  final token = '46d9b14885a16794914c046b218b63ede262f05d';

  @override
  Future<MarkerResponse> getMarkerByBounds(LatLng latLng1, LatLng latLng2) async {
    final response = await httpService.get(
        '/map/bounds?token=${token}&latlng=${latLng1.latitude},${latLng1.longitude},${latLng2.latitude},${latLng2.longitude}'
    );
    return MarkerResponse.fromJson(response);
  }
}
