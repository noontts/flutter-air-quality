import 'package:air_quality/features/home/data/repository/aqi_repository.dart';
import 'package:air_quality/features/home/domain/ports/aqi/repository.dart';
import 'package:air_quality/features/home/domain/ports/aqi/services.dart';
import 'package:air_quality/features/home/domain/services/aqi_service.dart';
import 'package:core_libs/dependency_injection/get_it.dart';

void registerAQIService (){
  getIt.registerSingleton<IAQIRepository>(AQIRepository());
  getIt.registerSingleton<IAQIService>(AQIService());
}