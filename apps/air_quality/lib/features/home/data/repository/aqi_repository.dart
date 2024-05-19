import 'package:air_quality/features/home/data/model/aqi_dto.dart';
import 'package:air_quality/features/home/domain/ports/aqi/repository.dart';
import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:core_libs/networks/http/http_service.dart';
import 'package:latlong2/latlong.dart';

class AQIRepository implements IAQIRepository {
  final HttpService httpService = getIt.get<HttpService>();
  final token = '46d9b14885a16794914c046b218b63ede262f05d';

  @override
  Future<AQIDetailResponse> getAqiDetailByLatLng(LatLng latLng) async{
    final response = await httpService.get(
        '/feed/geo:${latLng.latitude};${latLng.longitude}/?token=${token}');

    return AQIDetailResponse.fromJson(response);
  }

  @override
  Future<AQIDetailResponse> getAqiDetailById(int id) async{
    final response = await httpService.get(
        '/feed/@${id}/?token=${token}');

    return AQIDetailResponse.fromJson(response);
  }

  @override
  Future<AQIDetailResponse> getAqiDetailByIP() async{
    final response = await httpService.get(
        '/feed/here/?token=${token}');

    return AQIDetailResponse.fromJson(response);
  }
}
