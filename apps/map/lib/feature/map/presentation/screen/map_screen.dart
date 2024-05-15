import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/feature/map/domain/ports/map/services.dart';
import 'package:core_libs/utils/debounce.dart';
import 'package:map/feature/map/presentation/widget/gradient_aqi.dart';
import 'package:map/feature/map/presentation/widget/pm_25_info.dart';
import 'package:map/feature/map/presentation/widget/pm_25_number.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../widget/marker_pm.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final PanelController _pc = PanelController();
  IMapService service = getIt.get<IMapService>();
  final mockLatLng = [18.80823885274427, 98.9541342695303];
  final _debounce = Debounce(milliseconds: 350);
  List<Marker> fullListMarker = [];
  List<Marker> visibleMarker = [];
  String stationName = '';
  int aqi = 0;

  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  void initState() {
    super.initState();
  }

  void getListMarker(MapPosition position) async {
    var listMarkerDisplay = await service.getMarkerByBounds(position.bounds!);

    fullListMarker = listMarkerDisplay
        .map((e) => Marker(
            width: 70,
            height: 70,
            point: LatLng(e.lat, e.lon),
            child: MarkerPM25(
              pm: e.aqi,
              latLng: LatLng(e.lat, e.lon),
              name: e.name,
              onClick: updateSlidingPanel,
            )))
        .toList();

    updateVisibleMarker();
  }

  void updateVisibleMarker() {
    setState(() {
      visibleMarker = fullListMarker;
    });
  }

  void updateSlidingPanel(int aqi, String name) async {
    setState(() {
      stationName = name;
      this.aqi = aqi;
    });
    await _pc.show();
    await _pc.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: _pc,
        borderRadius: radius,
        maxHeight: 200,
        panel: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Pm25Number(aqi: aqi),
                      const SizedBox(width: 20),
                      Pm25Info(name: stationName, aqi: aqi),
                    ],
                  ),
                ),
                const GradientAqi()
              ],
            ),
          ),
        ),
        body: Center(
          child: FlutterMap(
              options: MapOptions(
                onTap: (_, point) async {
                  await _pc.hide();
                },
                initialCenter: LatLng(mockLatLng[0], mockLatLng[1]),
                initialZoom: 14,
                onPositionChanged: (position, _) {
                  _debounce.run(() {
                    setState(() {
                      getListMarker(position);
                    });
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(markers: visibleMarker),
              ]),
        ),
      ),
    );
  }
}
