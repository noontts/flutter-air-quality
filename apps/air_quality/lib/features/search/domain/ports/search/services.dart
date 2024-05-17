import 'package:air_quality/features/search/domain/entities/search_result.dart';

abstract class ISearchService{
  Future<List<SearchResult>> getSearchByKeyword(String keyword);
}