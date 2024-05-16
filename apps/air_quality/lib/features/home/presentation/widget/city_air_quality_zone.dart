import 'package:core_libs/utils/air_quality_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CityAirQualityZone extends StatelessWidget {
  const CityAirQualityZone({super.key});

   


  @override
  Widget build(BuildContext context) {

    const apiPm = 49;

    final backgroundGradientColor = getAqiGradientMainZone(apiPm);
    // final avgTextColor = aqiToColor(apiPm);

    return Column(
        children: [
          Stack(
            children: [
              Container(
                height: 340,       
                decoration: BoxDecoration(
                  gradient: backgroundGradientColor,  
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.search),
                              iconSize: 35,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              onPressed: () {},
                            ),
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
                            const Text("    ") //บังคับให้เว้นสวยๆ
                          ],
                        ),
                      ),
                      const Center(
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                  child: Container(
                    height: 200,
                    child: Image.asset(
                      '../core/assets/images/town_main.png', 
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