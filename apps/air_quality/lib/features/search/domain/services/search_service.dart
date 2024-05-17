import 'package:air_quality/features/search/domain/entities/search_result.dart';
import 'package:air_quality/features/search/domain/ports/search/repository.dart';
import 'package:air_quality/features/search/domain/ports/search/services.dart';
import 'package:core_libs/dependency_injection/get_it.dart';

class SearchService implements ISearchService{
  final ISearchRepository repository = getIt.get<ISearchRepository>();

  @override
  Future<List<SearchResult>> getSearchByKeyword(String keyword) async{
    final rawResponse = await repository.getSearchByKeyword(keyword);

    return rawResponse.data!.map((e) => SearchResult(city: e.station!.name!, pm25: e.aqi == '-' ? 0 : int.parse(e.aqi!))).toList();
    
  }
}