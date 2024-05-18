import 'package:flutter/material.dart';

class ObservationCard extends StatelessWidget {
  const ObservationCard({super.key , required this.indexMaidex , required this.textTitle , required this.textSubTitle});

  final int indexMaidex;
  final String textTitle;
  final String textSubTitle;

  @override
  Widget build(BuildContext context) {

    String imageObservationCard;

    switch (indexMaidex) {
      case 1:
        imageObservationCard = 'assets/images/temp.png';
        break;
      case 2:
        imageObservationCard = 'assets/images/PM10Icon.png';
        break;
      case 3:
        imageObservationCard = 'assets/images/OzoneIcon.png';
        break;
      case 4:
        imageObservationCard = 'assets/images/wind.png';
        break;
      default:
        imageObservationCard = '';
    }



    return Center(
      child: Card(
        color: Colors.white,
        child: SizedBox(
          height: 75,
          width: 165,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: SizedBox(
                  width: 42,
                  height: 42,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(imageObservationCard),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: Text(textTitle , style: const TextStyle(fontSize: 15 , fontWeight: FontWeight.w700),),
                subtitle: Text(overflow: TextOverflow.ellipsis,textSubTitle, style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.normal),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
