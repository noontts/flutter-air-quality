import 'package:air_quality/features/search/presentation/widget/search_found_card.dart';
import 'package:air_quality/features/search/presentation/widget/search_zone.dart';
import 'package:core_libs/utils/air_quality_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
              SearchZone(), 
              SearchFoundCard(
                location: 'Chaimeang', 
                aqi: 77,
              ),
              SearchFoundCard(
                location: 'B', 
                aqi: 49,
              ),
              SearchFoundCard(
                location: 'C', 
                aqi: 115,
              ),
              SearchFoundCard(
                location: 'D', 
                aqi: 179,
              ),
            ],
          ),
        ),
    );
  }
}
