import 'package:flutter/material.dart';
import 'package:air_quality/features/home/presentation/widget/daily_status_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
