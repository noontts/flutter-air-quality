import 'package:air_quality/features/home/presentation/widget/daily_status_card.dart';
import 'package:core_ui/section_texts/my_air_text_header.dart';
import 'package:flutter/material.dart';

class DailyCard extends StatelessWidget {
  const DailyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        const MyAirTextHeader(
          title: 'Weaky PM2.5',
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(8.0), 
                child: DailyStatusCard(
                  date:
                      '${15 + index} May', 
                  number: 40, 
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
