import 'package:air_quality/features/search/domain/entities/search_result.dart';
import 'package:air_quality/features/search/domain/ports/search/repository.dart';
import 'package:air_quality/features/search/domain/ports/search/services.dart';
import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:latlong2/latlong.dart';

class SearchService implements ISearchService {
  final ISearchRepository repository = getIt.get<ISearchRepository>();

  @override
  Future<List<SearchResult>> getSearchByKeyword(String keyword) async {
    final rawResponse = await repository.getSearchByKeyword(keyword);

    return rawResponse.data!
        .map((e) => SearchResult(
            stationId: e.uid!,
            city: e.station!.name!, 
            pm25: e.aqi == '-' ? 0 : int.parse(e.aqi!),
            latlng: LatLng(e.station!.geo![0], e.station!.geo![1]),
            ))
        .toList();
  }
}
