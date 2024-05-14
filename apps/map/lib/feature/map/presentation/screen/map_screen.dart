import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/mock/marker_mock.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatefulWidget{
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mockLatLng = [18.80823885274427, 98.9541342695303];
  List<Marker> listMarker = [];

  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  void initState() {
    super.initState();
    getListMarker();
  }

  void getListMarker () async{
    listMarker = await listMockMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius: radius,
        panel: const Center(
          child: Text('Show detail PM.25'),
        ),
        body: Center(
          child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(mockLatLng[0], mockLatLng[1]),
                initialZoom: 14,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(markers: [
                  ...listMarker
                ]),
              ]
          ),
        ),
      ),
    );
  }
}
