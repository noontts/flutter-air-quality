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
        imageObservationCard = '../core/assets/images/PM25Icon.jpeg';
        break;
      case 2:
        imageObservationCard = '../core/assets/images/PM10Icon.png';
        break;
      case 3:
        imageObservationCard = '../core/assets/images/OzoneIcon.png';
        break;
      case 4:
        imageObservationCard = '../core/assets/images/UVIcon.png';
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
                title: Text(textTitle , style: const TextStyle(fontSize: 12 , fontWeight: FontWeight.normal),),
                subtitle: Text(textSubTitle, style: const TextStyle(fontSize: 12 , fontWeight: FontWeight.normal),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}