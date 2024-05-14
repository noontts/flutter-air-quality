import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:map/feature/map/data/repository/map_repository.dart';
import 'package:map/feature/map/domain/ports/map/repository.dart';
import 'package:map/feature/map/domain/ports/map/services.dart';
import 'package:map/feature/map/domain/services/map_service.dart';

void registerMapService(){
  getIt.registerSingleton<IMapRepository>(MapRepository());
  getIt.registerSingleton<IMapService>(MapService());
}