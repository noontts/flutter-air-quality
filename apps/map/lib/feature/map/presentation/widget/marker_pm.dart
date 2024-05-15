import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:latlong2/latlong.dart';
import 'package:core_libs/utils/air_quality_color.dart';

class MarkerPM25 extends StatelessWidget {
  final int pm;
  final LatLng latLng;
  final String name;
  final Function onClick;

  const MarkerPM25({super.key, required this.pm, required this.latLng,
    required this.name, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: JustTheTooltip(
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(name),
        ),
        child: Material(
          elevation: 60,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            decoration: BoxDecoration(
              color: aqiToColor(pm),
              gradient: getAqiGradient(pm),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(child: Text((pm).toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800
            ),)),
          ),
        ),
      ),
      onTap: () {onClick(pm, name);},
    );
  }
}
