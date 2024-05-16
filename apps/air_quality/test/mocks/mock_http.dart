import 'package:core_libs/networks/http/http_service.dart';

class MockHttpService extends HttpService{
  dynamic data;

  MockHttpService(super.url);

  @override
  Future delete(String path, data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String path) async{
    return await data;
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

}