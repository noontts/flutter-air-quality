import 'package:flutter/material.dart';

class ForecstCard extends StatelessWidget {
  final String date;
  final String number;

  const ForecstCard({ required this.date, required this.number});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        height: 120,
        child: Stack(
          children: [
            Container(
              width: 80,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 64, 131, 246), // Start color
                    const Color.fromARGB(255, 125, 192, 247), // Middle color
                    const Color.fromARGB(255, 248, 249, 250), // End color
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x88000000),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
