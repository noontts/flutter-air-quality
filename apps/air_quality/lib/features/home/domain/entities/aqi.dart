import 'package:air_quality/features/home/data/model/aqi_dto.dart';

class AqiToDisplay{
  final Iaqi aqiList;
  final List<DailyForecast> forecastPM25;
  final String stationName;

  AqiToDisplay({required this.aqiList, required this.forecastPM25, required this.stationName});
}