import 'package:flutter/material.dart';
import 'package:core_libs/utils/air_quality_color.dart';

class DailyStatusCard extends StatelessWidget {
  final String date;
  final int number;

  const DailyStatusCard({required this.date, required this.number});

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
              decoration: BoxDecoration(
                gradient:gradient
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      (number.toString()),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20, 
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
