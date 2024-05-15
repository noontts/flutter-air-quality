import 'package:core_libs/utils/air_quality_color.dart';
import 'package:flutter/material.dart';

class Pm25Number extends StatelessWidget {
  final int aqi;

  const Pm25Number({super.key, required this.aqi});

  @override
  Widget build(BuildContext context) {
    return Text((aqi).toString(),
    style: TextStyle(
        color: aqiToColor(aqi),
        fontSize: 45,
        fontWeight: FontWeight.w900
      ),
    );
  }
}
