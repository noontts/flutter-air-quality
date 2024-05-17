import 'package:air_quality/features/home/data/model/aqi_dto.dart';
import 'package:air_quality/features/home/presentation/widget/daily_status_card.dart';
import 'package:core_ui/section_texts/my_air_text_header.dart';
import 'package:flutter/material.dart';

class DailyCard extends StatelessWidget {
  final List<DailyForecast> forecastPM25;
  const DailyCard({super.key, required this.forecastPM25});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        const MyAirTextHeader(
          title: 'Weekly PM2.5',
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecastPM25.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DailyStatusCard(
                  date: forecastPM25[index].day!,
                  number: forecastPM25[index].avg!,
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
