import 'package:core_libs/utils/air_quality_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pm25Info extends StatelessWidget {
  final String name;
  final int aqi;

  const Pm25Info({super.key, required this.name, required this.aqi});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aqiToText(aqi),
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
          Container(
            child: Text(
              "AIR QI ${aqi} air pollution at ${name}",
              maxLines: 2,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )
      ],
    );
  }
}
