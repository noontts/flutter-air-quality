import 'package:flutter/material.dart';

class DailyStatusCard extends StatelessWidget {
  final String date;
  final String number;

  const DailyStatusCard({required this.date, required this.number});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        height: 120,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                 color: Colors.grey.withOpacity(0.5), // เปลี่ยนความเข้มของสีเงา
                spreadRadius: 1,
                blurRadius: 5, // เพิ่มความเบลอของเงา
                offset: Offset(0, 5), // ย้ายเงาลงมาด้านล่าง
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 64, 131, 246), //// Middle color
                    const Color.fromARGB(255, 248, 249, 250), // End color
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black, // Text color
                      ),
                    ),
                    SizedBox(height: 20), 
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black, // Text color
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
