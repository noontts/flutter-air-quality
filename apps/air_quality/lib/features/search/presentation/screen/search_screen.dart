import 'package:air_quality/features/search/domain/entities/search_result.dart';
import 'package:air_quality/features/search/domain/ports/search/services.dart';
import 'package:air_quality/features/search/presentation/widget/search_found_card.dart';
import 'package:air_quality/features/search/presentation/widget/search_zone.dart';
import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:core_libs/utils/debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchResult> searchResult = [];
  ISearchService service = getIt.get<ISearchService>();
  final _debounce = Debounce(milliseconds: 350);

  void getSearchByKeyword(String keyword) async {
    final response = await service.getSearchByKeyword(keyword);
    setState(() {
      searchResult = response;
    });
  }

  void onSearch(String keyword) {
    _debounce.run(() {
      getSearchByKeyword(keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF47F5F5), Color(0xFFE7FFFF)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            SearchZone(
              onSearch: onSearch,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return SearchFoundCard(
                    location: searchResult[index].city,
                    aqi: searchResult[index].pm25,
                    latLng: searchResult[index].latlng,
                    stationId: searchResult[index].stationId,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
