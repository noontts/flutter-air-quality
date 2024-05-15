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
    return Container(
      color: Colors.white,
      child: const Column(
        children: [
            SizedBox(height: 400, child: Stack(children: [CityAirQualityZone()])),
            SizedBox(height: 250,child: CurrentObservation()),
            // SizedBox(height: 200,child: CurrentObservation()),
        ],
      ),
    );
  }
}
