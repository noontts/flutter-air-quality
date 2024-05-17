import 'package:air_quality/features/home/domain/entities/aqi.dart';
import 'package:air_quality/features/home/domain/ports/aqi/services.dart';
import 'package:air_quality/features/home/presentation/widget/city_air_quality_zone.dart';
import 'package:air_quality/features/home/presentation/widget/current_observation.dart';
import 'package:air_quality/features/home/presentation/widget/daily_card.dart';
import 'package:core_libs/dependency_injection/get_it.dart';
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

  @override
  void initState() {
    super.initState();
    getCurrentAqiDetail(mockCurrentLatLng);
  }

  void getCurrentAqiDetail(LatLng latLng) async {
    final response = await service.getAqiDetailByLatLng(latLng);

    setState(() {
      aqiToDisplay = response;
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
      body: ListView(
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
                    height: 250,
                    child: CurrentObservation(
                      observationAQI: aqiToDisplay.aqiList,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
