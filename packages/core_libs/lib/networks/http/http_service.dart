abstract class HttpService{
  final String url;

  HttpService(this.url);

  Future get(String path);
  Future post(String path, dynamic data);
  Future put(String path, dynamic data);
  Future patch(String path, dynamic data);
  Future delete(String path, dynamic data);
}