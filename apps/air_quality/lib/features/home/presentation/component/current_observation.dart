import 'package:air_quality/features/home/presentation/widget/forecast_card.dart';
import 'package:flutter/material.dart';

class CurrentObservation extends StatelessWidget {
  const CurrentObservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 2, 
        mainAxisSpacing: 2, 
        children: [
          ForecastCard(
            indexMaidex: 1,
            textTitle: 'PM2.5',
            textSubTitle: 'idk',
          ),
          ForecastCard(
            indexMaidex: 2,
            textTitle: 'PM10',
            textSubTitle: 'idk',
          ),
          ForecastCard(
            indexMaidex: 3,
            textTitle: 'Ozone',
            textSubTitle: 'idk',
          ),
          ForecastCard(
            indexMaidex: 4,
            textTitle: 'UV index',
            textSubTitle: 'idk',
          ),
        ],
      ),
    );
  }
}
