import 'package:air_quality/features/search/data/models/search_dto.dart';
import 'package:air_quality/features/search/domain/ports/search/repository.dart';
import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:core_libs/networks/http/http_service.dart';

class SearchRepository implements ISearchRepository{
  final HttpService httpService = getIt.get<HttpService>();
  final token = '46d9b14885a16794914c046b218b63ede262f05d';

  @override
  Future<SearchResponse> getSearchByKeyword(String keyword) async{
        final response = await httpService.get(
        '/search/?keyword=${keyword}&token=${token}');
    return SearchResponse.fromJson(response);
  }
}