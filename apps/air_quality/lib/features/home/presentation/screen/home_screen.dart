import 'package:air_quality/features/home/presentation/widget/city_air_quality_zone.dart';
import 'package:air_quality/features/home/presentation/widget/current_observation.dart';
import 'package:air_quality/features/home/presentation/widget/observation_card.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('No IQ Air'),
        leading: IconButton(
          onPressed: () {
            //do someting
          }, icon: Icon(Icons.search),
          ),
          actions: [
            IconButton(
              onPressed: () {
              //do someting
              },
               icon: Icon(Icons.menu),
              ),
          ],
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        child: const Column(
        children: [
            SizedBox(height: 400, child: Stack(children: [CityAirQualityZone()])),
            SizedBox(height: 250,child: CurrentObservation()),
            // SizedBox(height: 200,child: CurrentObservation()),
        ],
       ) ,
      ),
    );
  }
}
