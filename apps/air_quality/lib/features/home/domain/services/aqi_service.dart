import 'package:air_quality/features/home/domain/entities/aqi.dart';
import 'package:air_quality/features/home/domain/ports/aqi/repository.dart';
import 'package:air_quality/features/home/domain/ports/aqi/services.dart';
import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:latlong2/latlong.dart';

class AQIService implements IAQIService {
  final IAQIRepository repository = getIt.get<IAQIRepository>();

  @override
  Future<AqiToDisplay> getAqiDetailByLatLng(LatLng latLng) async {
    final rawResponse = await repository.getAqiDetailByLatLng(latLng);

    return AqiToDisplay(
        aqiList: rawResponse.data!.iaqi!,
        forecastPM25: rawResponse.data!.forecast!.daily!.pm25!,
        stationName: rawResponse.data!.city!.name!);
  }

  @override
  Future<AqiToDisplay> getAqiDetailById(int id) async {
    final rawResponse = await repository.getAqiDetailById(id);

    return AqiToDisplay(
        aqiList: rawResponse.data!.iaqi!,
        forecastPM25: rawResponse.data!.forecast!.daily!.pm25!,
        stationName: rawResponse.data!.city!.name!);
  }
}
