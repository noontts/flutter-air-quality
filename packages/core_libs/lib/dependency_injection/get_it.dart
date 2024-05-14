import 'package:core_libs/networks/http/dio_service.dart';
import 'package:core_libs/networks/http/http_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void registerCoreServices(){
  getIt.registerSingleton<HttpService>(DioService("https://api.waqi.info"));
}