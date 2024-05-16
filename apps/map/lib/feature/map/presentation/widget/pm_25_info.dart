import 'package:core_libs/utils/air_quality_text.dart';
import 'package:flutter/material.dart';

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
          RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(children: <TextSpan>[
              const TextSpan(
                  text: 'PM2.5', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: ' $aqi μg/m3 ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black)),
              TextSpan(
                  text: 'air pollution at $name',
                  style: const TextStyle(color: Colors.black, height: 1.45))
            ]),
          ),
        ],
      ),
    );
  }
}
