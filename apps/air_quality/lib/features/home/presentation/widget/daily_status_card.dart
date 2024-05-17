import 'package:flutter/material.dart';
import 'package:core_libs/utils/air_quality_color.dart';
import 'package:moment_dart/moment_dart.dart';

class DailyStatusCard extends StatelessWidget {
  final String date;
  final int number;

  const DailyStatusCard({super.key, required this.date, required this.number});

  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = getAqiGradient(number);

    return Center(
      child: SizedBox(
        width: 70,
        height: 110,
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(gradient: gradient),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Moment(DateTime.parse(date)).format("DD/MM"),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      (number.toString()),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
