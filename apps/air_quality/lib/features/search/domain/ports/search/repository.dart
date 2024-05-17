import 'package:air_quality/features/search/data/models/search_dto.dart';

abstract class ISearchRepository{
  Future<SearchResponse> getSearchByKeyword(String keyword);
}