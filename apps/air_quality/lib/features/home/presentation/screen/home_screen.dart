import 'dart:async';
import 'package:air_quality/features/home/domain/entities/aqi.dart';
import 'package:air_quality/features/home/domain/ports/aqi/services.dart';
import 'package:air_quality/features/home/presentation/widget/city_air_quality_zone.dart';
import 'package:air_quality/features/home/presentation/widget/current_observation.dart';
import 'package:air_quality/features/home/presentation/widget/daily_card.dart';
import 'package:air_quality/features/home/presentation/widget/loading.dart';
import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:core_libs/utils/quote.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_router/go_router.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final mockCurrentLatLng = const LatLng(18.80823885274427, 98.9541342695303);
  IAQIService service = getIt.get<IAQIService>();
  late LatLng currentLatLng;
  late AqiToDisplay aqiToDisplay;
  var loading = true;
  String quote = '';

  @override
  void initState() {
    super.initState();
    loading = true;
    getCurrentAqiDetail(mockCurrentLatLng);
    updateQuote();

    Timer.periodic(const Duration(seconds: 15), (timer) {
      updateQuote();
    });
  }

  void getCurrentAqiDetail(LatLng latLng) async {
    loading = true;
    final response = await service.getAqiDetailByLatLng(latLng);

    setState(() {
      aqiToDisplay = response;
      loading = false;
    });
  }

  void updateQuote() {
    setState(() {
      quote = randomQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No IQ Air'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.push('/search');
          },
          icon: const Icon(Icons.search),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.gps_fixed),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: loading
          ? const LoadingFullScreen()
          : ListView(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 450,
                          child: Stack(children: [
                            CityAirQualityZone(
                              aqiPm: (aqiToDisplay.aqiList.pm25?.v)!.toInt(),
                              stationName: aqiToDisplay.stationName,
                            )
                          ])),
                      SizedBox(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Text(
                                quote,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                '- ทีม Dev ที่เอามาจาก google อีกที',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 250,
                          child: CurrentObservation(
                            observationAQI: aqiToDisplay.aqiList,
                          )),
                      DailyCard(forecastPM25: aqiToDisplay.forecastPM25)
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
