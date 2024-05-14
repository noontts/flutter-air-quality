import 'package:core_libs/networks/http/http_service.dart';
import 'package:dio/dio.dart';

class DioService extends HttpService{

  late Dio dio;

  DioService(super.url){
    dio = Dio();
  }

  @override
  Future get(String path) async{
    final response = await dio.get('${url}${path}');
    if(response.statusCode == 200){
      return response.data;
    }else{
      return null;
    }
  }

  @override
  Future patch(String path, data) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future post(String path, data) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String path, data) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future delete(String path, data) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}