import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:core_libs/utils/air_quality_color.dart';

class MarkerPM25 extends StatelessWidget {
  final int pm;
  final LatLng latLng;

  const MarkerPM25({super.key, required this.pm, required this.latLng});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(
        elevation: 60,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          decoration: BoxDecoration(
              color: aqiToColor(pm),
              gradient: getAqiGradient(pm),
              borderRadius: BorderRadius.circular(100),
          ),
          child: Center(child: Text((pm).toString())),
        ),
      ),
      onTap: () {
        print('${latLng.latitude} ${latLng.longitude}');
      },
    );
  }
}
