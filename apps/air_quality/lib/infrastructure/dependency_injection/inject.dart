import 'package:air_quality/features/home/data/repository/aqi_repository.dart';
import 'package:air_quality/features/home/domain/ports/aqi/repository.dart';
import 'package:air_quality/features/home/domain/ports/aqi/services.dart';
import 'package:air_quality/features/home/domain/services/aqi_service.dart';
import 'package:air_quality/features/search/data/repository/search_repository.dart';
import 'package:air_quality/features/search/domain/ports/search/repository.dart';
import 'package:air_quality/features/search/domain/ports/search/services.dart';
import 'package:air_quality/features/search/domain/services/search_service.dart';
import 'package:core_libs/dependency_injection/get_it.dart';

void registerAQIService (){
  getIt.registerSingleton<IAQIRepository>(AQIRepository());
  getIt.registerSingleton<IAQIService>(AQIService());

  getIt.registerSingleton<ISearchRepository>(SearchRepository());
  getIt.registerSingleton<ISearchService>(SearchService());
} 