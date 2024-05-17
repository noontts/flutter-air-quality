import 'package:latlong2/latlong.dart';

class SearchResult{

  final String city;
  final int pm25;
  final LatLng latlng;


  SearchResult({required this.city , required this.pm25 , required this.latlng});
}