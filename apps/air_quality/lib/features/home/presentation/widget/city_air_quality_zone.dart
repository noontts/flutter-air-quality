import 'package:core_libs/utils/air_quality_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CityAirQualityZone extends StatelessWidget {
  const CityAirQualityZone({super.key});

   


  @override
  Widget build(BuildContext context) {

    const apiPm = 141;

    final siNaMian = getAqiGradientMainZone(apiPm);
    final siText = aqiToColor(apiPm);

    return Column(
        children: [
          Stack(
            children: [
              Container(
                height: 340,       
                decoration: BoxDecoration(
                  gradient: siNaMian,  
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'No IQ Air',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '49',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Air Quality',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Good',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    
                  
                    ],
                  ),
                ),
              ),
              const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                  child: Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/town_main.png', 
                      fit: BoxFit.cover, 
                      height: 200,
                      
                    ),
                  ),
                ),
            ],
          ),
        ],
      );



  }
}