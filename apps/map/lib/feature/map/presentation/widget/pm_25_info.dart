import 'package:core_libs/utils/air_quality_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Pm25Info extends StatelessWidget {
  final String name;
  final int aqi;

  const Pm25Info({super.key, required this.name, required this.aqi});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            aqiToText(aqi),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
            Text(
              "AIR QI ${aqi} air pollution at ${name}",
              maxLines: 3,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
