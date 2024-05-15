import 'package:core_libs/networks/http/http_service.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/feature/map/data/repository/map_repository.dart';
import 'package:map/feature/map/domain/ports/map/repository.dart';
import 'package:map/feature/map/domain/ports/map/services.dart';
import 'package:map/feature/map/domain/services/map_service.dart';

import 'mocks/mock_http.dart';

void main(){
  final getIt = GetIt.instance;
  getIt.registerSingleton<HttpService>(MockHttpService(""));
  getIt.registerSingleton<IMapRepository>(MapRepository());
  getIt.registerSingleton<IMapService>(MapService());

  test('Get Station with bounds', ()async {
    final mockHttpService = getIt.get<HttpService>();

    (mockHttpService as MockHttpService).data =
    {
      "status": "ok",
      "data": [
        {
          "lat": 18.840732,
          "lon": 98.96978,
          "uid": 6817,
          "aqi": "76",
          "station": {
            "name": "City Hall, Chiangmai, Thailand (ศาลากลางเชียงใหม่)",
            "time": "2024-05-15T15:00:00+09:00"
          }
        },
        {
          "lat": 18.787747,
          "lon": 98.9931284,
          "uid": 5775,
          "aqi": "57",
          "station": {
            "name": "Chiang Mai",
            "time": "2024-05-15T15:00:00+09:00"
          }
        },
        {
          "lat": 18.7909333,
          "lon": 98.99,
          "uid": 1822,
          "aqi": "57",
          "station": {
            "name": "Yupparaj Wittayalai School, Chiangmai, Thailand (โรงเรียนยุพราชวิทยาลัย)",
            "time": "2024-05-15T15:00:00+09:00"
          }
        }
      ]
    };


    final mapService = getIt.get<IMapService>();
    final stations = await mapService.getMarkerByBounds(LatLngBounds(LatLng(0,0), LatLng(1,1)));

    expect(stations, isNotNull);
    expect(stations[0].name, isNotNull);
  });
}