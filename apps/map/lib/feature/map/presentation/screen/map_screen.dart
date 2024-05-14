import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/feature/map/domain/ports/map/services.dart';
import 'package:core_libs/utils/debounce.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatefulWidget{
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  IMapService service = getIt.get<IMapService>();
  final mockLatLng = [18.80823885274427, 98.9541342695303];
  final _debounce = Debounce(milliseconds: 350);
  List<Marker> fullListMarker = [];
  List<Marker> visibleMarker = [];

  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  void initState() {
    super.initState();
  }

  void getListMarker (MapPosition position) async{
    fullListMarker = await service.getMarkerByBounds(position.bounds!);
    updateVisibleMarker();
  }

  void updateVisibleMarker (){
    visibleMarker = fullListMarker;
    setState(() {});
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
                onPositionChanged: (position,_){
                  _debounce.run(() {
                    setState(() {
                      getListMarker(position);
                    });
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(markers: visibleMarker),
              ]
          ),
        ),
      ),
    );
  }
}
