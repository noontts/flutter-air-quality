import 'package:core_libs/utils/air_quality_color.dart';
import 'package:core_libs/utils/air_quality_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CityAirQualityZone extends StatelessWidget {
  final int aqiPm;
  final String stationName;

  const CityAirQualityZone({super.key, required this.aqiPm, required this.stationName});

  @override
  Widget build(BuildContext context) {
    final backgroundGradientColor = getAqiGradientMainZone(aqiPm);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 340,
              decoration: BoxDecoration(
                gradient: backgroundGradientColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        stationName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        aqiPm.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Air Quality',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        aqiToText(aqiPm),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 240, 0, 0),
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  '../core/assets/images/town_main.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
