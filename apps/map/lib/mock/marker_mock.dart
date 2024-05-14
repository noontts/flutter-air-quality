import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/feature/map/domain/entities/marker.dart';
import 'package:map/feature/map/presentation/widget/marker_pm.dart';

final mockMarker = <MarkerDisplay>[
  MarkerDisplay(lat: 18.7909333, lon: 98.99, aqi: 68, name:"City Hall, Chiangmai, Thailand (ศาลากลางเชียงใหม่)"),
  MarkerDisplay(lat: 18.840732, lon: 98.96978, aqi: 120, name:"Chiang Mai"),
  MarkerDisplay(lat: 18.787747, lon: 98.9931284, aqi: 230, name: "Yupparaj Wittayalai School, Chiangmai, Thailand (โรงเรียนยุพราชวิทยาลัย)"),
];



List<Marker> listMockMarkers(){
  var listMockMarker = <Marker>[];

  for(final mock in mockMarker){
    listMockMarker.add(
        Marker(
            width: 70,
            height: 70,
            point: LatLng(mock.lat, mock.lon),
            child: MarkerPM25(pm: mock.aqi, latLng: LatLng(mock.lat, mock.lon),name: mock.name,)
        ));
  }

  return listMockMarker;
}