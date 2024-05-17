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
  late AqiToDisplay aqiToDisplay;

  @override
  void initState() {
    super.initState();
    getCurrentAqiDetail(mockCurrentLatLng);
  }

  void getCurrentAqiDetail(LatLng latLng) async{
    final response = await service.getAqiDetailByLatLng(latLng);

    setState(() {
      aqiToDisplay = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('No IQ Air'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
             context.push('/search');
          }, icon: Icon(Icons.search),
          ),
          actions: [
            IconButton(
              onPressed: () {
              },
               icon: Icon(Icons.menu),
              ),
          ],
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: const Column(
            children: [
                SizedBox(height: 400, child: Stack(children: [CityAirQualityZone()])),
                SizedBox(height: 250,child: CurrentObservation()),
                SizedBox(height: 200,child: DailyCard()),
            ],
           ) ,
          ),
        ],
      ),
    );
  }
}
