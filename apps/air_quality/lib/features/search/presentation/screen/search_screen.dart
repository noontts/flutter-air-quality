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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF47F5F5), Color(0xFFE7FFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              SearchZone(), // เรียกใช้ SearchZone ที่ถูกแก้ไขแล้
              SearchFoundCard(
                location: 'Chaimeang', // แก้ชื่อของพารามิเตอร์เป็น location แทน rocation
                aqi: 77,
              ),
              SearchFoundCard(
                location: 'B', // แก้ชื่อของพารามิเตอร์เป็น location แทน rocation
                aqi: 49,
              ),
              SearchFoundCard(
                location: 'C', // แก้ชื่อของพารามิเตอร์เป็น location แทน rocation
                aqi: 115,
              ),
              SearchFoundCard(
                location: 'D', // แก้ชื่อของพารามิเตอร์เป็น location แทน rocation
                aqi: 179,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
