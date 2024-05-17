
import 'package:core_libs/utils/air_quality_color.dart';
import 'package:flutter/material.dart';

class SearchFoundCard extends StatelessWidget {
  const SearchFoundCard({super.key, required this.location, required this.aqi});

  final String location;
  final int aqi;

  @override
  Widget build(BuildContext context) {
    final textcolor = aqiToColor(aqi);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
      child: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4), 
                blurRadius: 4, 
              ),
            ],
          ),
          width: 350,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  location,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('$aqi',
                        style: TextStyle(
                          color: textcolor,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.black.withOpacity(0.55),
                            ),
                          ],
                        )),
                    const Text(
                      'AQI',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
