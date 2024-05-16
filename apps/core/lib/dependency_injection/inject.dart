import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:map/infrastructure/dependency_injection/inject.dart';

void registerService(){
  registerCoreServices();
  registerMapService();
}