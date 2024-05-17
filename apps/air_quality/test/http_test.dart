import 'package:air_quality/features/home/data/repository/aqi_repository.dart';
import 'package:air_quality/features/home/domain/ports/aqi/repository.dart';
import 'package:air_quality/features/home/domain/ports/aqi/services.dart';
import 'package:air_quality/features/home/domain/services/aqi_service.dart';
import 'package:air_quality/features/search/data/repository/search_repository.dart';
import 'package:air_quality/features/search/domain/ports/search/repository.dart';
import 'package:air_quality/features/search/domain/ports/search/services.dart';
import 'package:air_quality/features/search/domain/services/search_service.dart';
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

  getIt.registerSingleton<ISearchRepository>(SearchRepository());
  getIt.registerSingleton<ISearchService>(SearchService());

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
  test('Get aqi detail from id', () async{
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
    final aqiDetailResponse = aqiService.getAqiDetailById(1169);

    expect(aqiDetailResponse, isNotNull);

  });

  test('Get aqi city and pm25 from keyword', () async{
    final mockHttpService = getIt.get<HttpService>();

    (mockHttpService as MockHttpService).data =
    {
    "status": "ok",
    "data": [
        {
            "uid": 11204,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2022-10-19 05:00:00",
                "vtime": 1666130400
            },
            "station": {
                "name": "Chiang Dao Public Heath Office, Thailand; Chiang Dao Public Heath Office, Thailand (สสอ. เชียงดาว จ. เชียงใหม่)",
                "geo": [
                    19.366273,
                    98.964704
                ],
                "url": "thailand/chiang-dao-public-heath-office"
            }
        },
        {
            "uid": 11697,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2022-10-19 05:00:00",
                "vtime": 1666130400
            },
            "station": {
                "name": "Chiang Mai University (Mae Hia), Thailand; Chiang Mai University (Mae Hia), Thailand (มหาวิทยาลัยเชียงใหม่ แคมปัสแม่เหียะ)",
                "geo": [
                    18.761371,
                    98.931855
                ],
                "url": "thailand/chiang-mai-university-mae-hia"
            }
        },
        {
            "uid": 5775,
            "aqi": "36",
            "time": {
                "tz": "+07:00",
                "stime": "2024-05-17 16:00:00",
                "vtime": 1715936400
            },
            "station": {
                "name": "Chiang Mai",
                "geo": [
                    18.787747,
                    98.9931284
                ],
                "url": "chiang-mai"
            }
        },
        {
            "uid": 11700,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2022-10-18 08:00:00",
                "vtime": 1666054800
            },
            "station": {
                "name": "Chiang Kham Hospital, Phayao, Thailand; Chiang Kham Hospital, Phayao, Thailand (โรงพยาบาลแม่สาย จ. เชียงราย)",
                "geo": [
                    20.4297199,
                    99.8760813
                ],
                "url": "thailand/phayao/chiang-kham-hospital"
            }
        },
        {
            "uid": 11443,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2022-07-13 11:00:00",
                "vtime": 1657684800
            },
            "station": {
                "name": "Chiang Rai Hospital, Thailand; Chiang Rai Hospital, Thailand (รพ. เชียงรายประชานุเคราะห์ จ. เชียงราย)",
                "geo": [
                    19.9009819,
                    99.8289068
                ],
                "url": "thailand/chiang-rai-hospital"
            }
        },
        {
            "uid": 11373,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "1970-01-01 00:00:00",
                "vtime": 0
            },
            "station": {
                "name": "MFU, Chiang Rai, Thailand; MFU, Chiang Rai, Thailand (มฟล. เชียงราย)",
                "geo": [
                    20.045041,
                    99.893729
                ],
                "url": "thailand/chiang-rai/mfu"
            }
        },
        {
            "uid": 5776,
            "aqi": "72",
            "time": {
                "tz": "+07:00",
                "stime": "2024-05-17 16:00:00",
                "vtime": 1715936400
            },
            "station": {
                "name": "Mueang Chiang Rai",
                "geo": [
                    19.9104798,
                    99.840576
                ],
                "url": "mueang-chiang-rai"
            }
        },
        {
            "uid": 11378,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2019-05-07 10:00:00",
                "vtime": 1557198000
            },
            "station": {
                "name": "AIA Co.,Ltd., Chiang Mai, Thailand; AIA Co.,Ltd., Chiang Mai, Thailand (บ. เอไอเอ จำกัด)",
                "geo": [
                    18.7809,
                    98.9766208
                ],
                "url": "thailand/chiang-mai/ltd./aia-co."
            }
        },
        {
            "uid": 11696,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2022-10-18 11:00:00",
                "vtime": 1666065600
            },
            "station": {
                "name": "Innovative Village, T. Pa Dad, Chiang Mai, Thailand; Innovative Village, T. Pa Dad, Chiang Mai, Thailand (Innovative Village ต. ป่าแดด จ. เชียงใหม่)",
                "geo": [
                    18.745484,
                    98.980442
                ],
                "url": "thailand/chiang-mai/t.-pa-dad/innovative-village"
            }
        },
        {
            "uid": 11554,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "1970-01-01 00:00:00",
                "vtime": 0
            },
            "station": {
                "name": "Mae Fah Luang University, Chiang Rai, Thailand; Mae Fah Luang University, Chiang Rai, Thailand (สำนักวิชาเทคโนโลยีสารสนเทศ อาคาร E3A-Building)",
                "geo": [
                    20.04651,
                    99.892233
                ],
                "url": "thailand/chiang-rai/mae-fah-luang-university"
            }
        },
        {
            "uid": 11400,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2021-01-28 09:00:00",
                "vtime": 1611799200
            },
            "station": {
                "name": "Yupparaj Wittayalai School, Chiang Mai, Thailand; Yupparaj Wittayalai School, Chiang Mai, Thailand (รร. ยุพราชวิทยาลัย จ. เชียงใหม่)",
                "geo": [
                    18.79273,
                    98.987822
                ],
                "url": "thailand/chiang-mai/yupparaj-wittayalai-school"
            }
        },
        {
            "uid": 9473,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "1970-01-01 00:00:00",
                "vtime": 0
            },
            "station": {
                "name": "Chiangmai - CMIS, Thailand",
                "geo": [
                    18.797768,
                    99.0046
                ],
                "url": "thailand/chiangmai---cmis"
            }
        },
        {
            "uid": 11558,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2021-11-18 08:00:00",
                "vtime": 1637197200
            },
            "station": {
                "name": "Chiangmuan Hospital, Phayao, Thailand (อบต. บ้านมาง อ. เชียงม่วน จ. พะเยา)",
                "geo": [
                    18.89607,
                    100.28346
                ],
                "url": "thailand/phayao/chiangmuan-hospital"
            }
        },
        {
            "uid": 9467,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "1970-01-01 00:00:00",
                "vtime": 0
            },
            "station": {
                "name": "Chiangrai - Gaia Station 03, Thailand",
                "geo": [
                    19.920029,
                    99.84038
                ],
                "url": "thailand/chiangrai---gaia-station-03"
            }
        },
        {
            "uid": 9587,
            "aqi": "74",
            "time": {
                "tz": "+07:00",
                "stime": "2024-05-17 16:00:00",
                "vtime": 1715936400
            },
            "station": {
                "name": "Chiangrai - Gaia Station 07, Thailand",
                "geo": [
                    19.858547,
                    99.90148
                ],
                "url": "thailand/chiangrai---gaia-station-07"
            }
        },
        {
            "uid": 9450,
            "aqi": "83",
            "time": {
                "tz": "+07:00",
                "stime": "2024-05-17 16:00:00",
                "vtime": 1715936400
            },
            "station": {
                "name": "Chiangrai - Gaia Station 01, Thailand",
                "geo": [
                    19.687157,
                    100.19024
                ],
                "url": "thailand/chiangrai---gaia-station-01"
            }
        },
        {
            "uid": 6817,
            "aqi": "74",
            "time": {
                "tz": "+07:00",
                "stime": "2024-05-17 16:00:00",
                "vtime": 1715936400
            },
            "station": {
                "name": "City Hall, Chiangmai, Thailand (ศาลากลางเชียงใหม่)",
                "geo": [
                    18.840732,
                    98.96978
                ],
                "url": "thailand/chiangmai/city-hall",
                "country": "TH"
            }
        },
        {
            "uid": 1822,
            "aqi": "36",
            "time": {
                "tz": "+07:00",
                "stime": "2024-05-17 16:00:00",
                "vtime": 1715936400
            },
            "station": {
                "name": "Yupparaj Wittayalai School, Chiangmai, Thailand (โรงเรียนยุพราชวิทยาลัย)",
                "geo": [
                    18.7909333,
                    98.99
                ],
                "url": "thailand/chiangmai/yupparaj-wittayalai-school",
                "country": "TH"
            }
        },
        {
            "uid": 11214,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2022-10-19 05:00:00",
                "vtime": 1666130400
            },
            "station": {
                "name": "Nakornping Hospital, Thailand (รพ. นครพิงค์ จ. เชียงใหม่)",
                "geo": [
                    18.851765,
                    98.96723
                ],
                "url": "thailand/nakornping-hospital",
                "country": "TH"
            }
        },
        {
            "uid": 11208,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2022-10-19 05:00:00",
                "vtime": 1666130400
            },
            "station": {
                "name": "Ban Thammapakorn, Thailand (Bear Hug Cafe' ต. ช้างคลาน จ. เชียงใหม่)",
                "geo": [
                    18.7828996,
                    98.9933469
                ],
                "url": "thailand/ban-thammapakorn",
                "country": "TH"
            }
        },
        {
            "uid": 11206,
            "aqi": "-",
            "time": {
                "tz": "+07:00",
                "stime": "2022-10-19 05:00:00",
                "vtime": 1666130400
            },
            "station": {
                "name": "HPC 1, Thailand (รพ. ส่งเสริมสุขภาพ เขต 1 จ. เชียงใหม่)",
                "geo": [
                    18.772478,
                    98.995551
                ],
                "url": "thailand/hpc-1",
                "country": "TH"
            }
        }
    ]
};

    final searchService = getIt.get<ISearchService>();
    final detailSearchResponse = await searchService.getSearchByKeyword('c');

    expect(detailSearchResponse[0].city, "Chiang Dao Public Heath Office, Thailand; Chiang Dao Public Heath Office, Thailand (สสอ. เชียงดาว จ. เชียงใหม่)");

    
    }
  
  );
}

