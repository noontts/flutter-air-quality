import 'package:air_quality/features/home/data/repository/aqi_repository.dart';
import 'package:air_quality/features/home/domain/ports/aqi/repository.dart';
import 'package:air_quality/features/home/domain/ports/aqi/services.dart';
import 'package:air_quality/features/home/domain/services/aqi_service.dart';
import 'package:core_libs/networks/http/http_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'mocks/mock_http.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<HttpService>(MockHttpService(""));
  getIt.registerSingleton<IAQIRepository>(AQIRepository());
  getIt.registerSingleton<IAQIService>(AQIService());

  test('Get aqi detail from latlng', () async{
    final mockHttpService = getIt.get<HttpService>();

    (mockHttpService as MockHttpService).data =
      {
        "status": "ok",
        "data": {
          "aqi": 84,
          "idx": 6817,
          "attributions": [
            {
              "url": "http://aqmthai.com/",
              "name": "Division of Air Quality Data, Air Quality and Noise Management Bureau, Pollution Control Department.",
              "logo": "Thailand-PCD.png"
            },
            {
              "url": "https://waqi.info/",
              "name": "World Air Quality Index Project"
            }
          ],
          "city": {
            "geo": [
              18.840732,
              98.96978
            ],
            "name": "City Hall, Chiangmai, Thailand (ศาลากลางเชียงใหม่)",
            "url": "https://aqicn.org/city/thailand/chiangmai/city-hall",
            "location": ""
          },
          "dominentpol": "pm25",
          "iaqi": {
            "dew": {
              "v": 22.5
            },
            "h": {
              "v": 45.5
            },
            "no2": {
              "v": 7.5
            },
            "o3": {
              "v": 14.6
            },
            "p": {
              "v": 1007.5
            },
            "pm10": {
              "v": 91
            },
            "pm25": {
              "v": 84
            },
            "so2": {
              "v": 0.6
            },
            "t": {
              "v": 36
            },
            "w": {
              "v": 3.6
            },
            "wg": {
              "v": 18
            }
          },
          "time": {
            "s": "2024-05-16 15:00:00",
            "tz": "+07:00",
            "v": 1715871600,
            "iso": "2024-05-16T15:00:00+07:00"
          },
          "forecast": {
            "daily": {
              "o3": [
                {
                  "avg": 20,
                  "day": "2024-05-14",
                  "max": 48,
                  "min": 2
                },
                {
                  "avg": 13,
                  "day": "2024-05-15",
                  "max": 51,
                  "min": 1
                },
                {
                  "avg": 1,
                  "day": "2024-05-16",
                  "max": 1,
                  "min": 1
                },
                {
                  "avg": 1,
                  "day": "2024-05-17",
                  "max": 4,
                  "min": 1
                },
                {
                  "avg": 5,
                  "day": "2024-05-18",
                  "max": 24,
                  "min": 1
                },
                {
                  "avg": 8,
                  "day": "2024-05-19",
                  "max": 31,
                  "min": 1
                },
                {
                  "avg": 14,
                  "day": "2024-05-20",
                  "max": 78,
                  "min": 1
                },
                {
                  "avg": 1,
                  "day": "2024-05-21",
                  "max": 1,
                  "min": 1
                }
              ],
              "pm10": [
                {
                  "avg": 19,
                  "day": "2024-05-14",
                  "max": 19,
                  "min": 19
                },
                {
                  "avg": 21,
                  "day": "2024-05-15",
                  "max": 28,
                  "min": 19
                },
                {
                  "avg": 29,
                  "day": "2024-05-16",
                  "max": 41,
                  "min": 19
                },
                {
                  "avg": 22,
                  "day": "2024-05-17",
                  "max": 28,
                  "min": 19
                },
                {
                  "avg": 19,
                  "day": "2024-05-18",
                  "max": 19,
                  "min": 19
                },
                {
                  "avg": 19,
                  "day": "2024-05-19",
                  "max": 19,
                  "min": 19
                },
                {
                  "avg": 19,
                  "day": "2024-05-20",
                  "max": 19,
                  "min": 19
                },
                {
                  "avg": 21,
                  "day": "2024-05-21",
                  "max": 26,
                  "min": 19
                },
                {
                  "avg": 19,
                  "day": "2024-05-22",
                  "max": 19,
                  "min": 19
                }
              ],
              "pm25": [
                {
                  "avg": 68,
                  "day": "2024-05-14",
                  "max": 68,
                  "min": 68
                },
                {
                  "avg": 72,
                  "day": "2024-05-15",
                  "max": 88,
                  "min": 68
                },
                {
                  "avg": 88,
                  "day": "2024-05-16",
                  "max": 124,
                  "min": 68
                },
                {
                  "avg": 74,
                  "day": "2024-05-17",
                  "max": 89,
                  "min": 68
                },
                {
                  "avg": 68,
                  "day": "2024-05-18",
                  "max": 68,
                  "min": 68
                },
                {
                  "avg": 68,
                  "day": "2024-05-19",
                  "max": 68,
                  "min": 68
                },
                {
                  "avg": 68,
                  "day": "2024-05-20",
                  "max": 68,
                  "min": 68
                },
                {
                  "avg": 71,
                  "day": "2024-05-21",
                  "max": 83,
                  "min": 68
                },
                {
                  "avg": 68,
                  "day": "2024-05-22",
                  "max": 68,
                  "min": 68
                }
              ]
            }
          },
          "debug": {
            "sync": "2024-05-16T17:06:01+09:00"
          }
        }
      };

    final aqiService = getIt.get<IAQIService>();
    final aqiDetailResponse = aqiService.getAqiDetailByLatLng(LatLng(1, 0));

    expect(aqiDetailResponse, isNotNull);

  });
}

