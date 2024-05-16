import 'package:air_quality/features/home/presentation/widget/daily_status_card.dart';
import 'package:flutter/material.dart';
 
class DailyCard extends StatelessWidget {
  const DailyCard({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(8.0), // Add padding between cards
            child: DailyStatusCard(
              date: '${15 + index} May', // Assuming dates increment from May 15
              number: '${100 + index}', // Optional: Adjust height as needed
            ),
          );
        },
      ),
    );
  }

}

