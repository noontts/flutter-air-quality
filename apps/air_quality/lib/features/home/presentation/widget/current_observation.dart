import 'package:air_quality/features/home/presentation/widget/observation_card.dart';
import 'package:core_ui/section_texts/my_air_text_header.dart';
import 'package:flutter/material.dart';

class CurrentObservation extends StatelessWidget {
  const CurrentObservation({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
          children: [
            const MyAirTextHeader(title: 'Current Observation',),
            Container(
              height: 200,
              margin: EdgeInsets.zero,
      
              child: MediaQuery.removePadding( //คุมเพราะ เวลาใช้ grid view มันจะเว้นข้างบน (งงว่าทำไมมันต้องเว้น)
                context: context,
                removeTop: true,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (1 / .5),
                  children: [
                    ObservationCard(
                      indexMaidex: 1,
                      textTitle: 'PM2.5',
                      textSubTitle: 'idk',
                    ),
                    ObservationCard(
                      indexMaidex: 2,
                      textTitle: 'PM10',
                      textSubTitle: 'idk',
                    ),
                    ObservationCard(
                      indexMaidex: 3,
                      textTitle: 'Ozone',
                      textSubTitle: 'idk',
                    ),
                    ObservationCard(
                      indexMaidex: 4,
                      textTitle: 'UV index',
                      textSubTitle: 'idk',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
