import 'dart:async';

import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/feature/map/domain/ports/map/services.dart';
import 'package:core_libs/utils/debounce.dart';
import 'package:map/feature/map/presentation/widget/gradient_aqi.dart';
import 'package:map/feature/map/presentation/widget/pm_25_info.dart';
import 'package:map/feature/map/presentation/widget/pm_25_number.dart';
import 'package:map/feature/map/presentation/widget/request_permission.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../widget/marker_pm.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final PanelController _pc;
  late IMapService service;
  late List<double> mockLatLng;
  late Debounce _debounce;
  late List<Marker> fullListMarker;
  late List<Marker> visibleMarker;
  late MapController _mapController;
  late String stationName;
  late int aqi;
  late BorderRadiusGeometry radius;
  late AlignOnUpdate _alignPositionOnUpdate;
  late final StreamController<double?> _alignPositionStreamController;
  late LatLng? _currentLocation;
  late bool positionPermission;

  @override
  void initState() {
    super.initState();
    positionPermission = false;
    _pc = PanelController();
    service = getIt.get<IMapService>();
    mockLatLng = [18.80823885274427, 98.9541342695303];
    _currentLocation = LatLng(mockLatLng[0], mockLatLng[1]);
    _debounce = Debounce(milliseconds: 350);
    fullListMarker = [];
    visibleMarker = [];
    _mapController = MapController();
    stationName = '';
    aqi = 0;
    radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    _alignPositionOnUpdate = AlignOnUpdate.always;
    _alignPositionStreamController = StreamController<double?>();
    _checkLocationPermission();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _alignPositionStreamController.close();
    super.dispose();
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          positionPermission = false;
        });
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        positionPermission = false;
      });
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      setState(() {
        positionPermission = true;
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print("Error getting location: $e");
    }
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
        body: !positionPermission
            ? RequestPermissionGPS(checkPermission: _checkLocationPermission,)
            : SlidingUpPanel(
                controller: _pc,
                borderRadius: radius,
                maxHeight: 200,
                minHeight: 0,
                panel: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
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
                      mapController: _mapController,
                      options: MapOptions(
                        onTap: (_, point) async {
                          await _pc.hide();
                        },
                        initialCenter: _currentLocation ??
                            LatLng(mockLatLng[0], mockLatLng[1]),
                        initialZoom: 13,
                        onPositionChanged: (position, hasGesture) {
                          if (hasGesture &&
                              _alignPositionOnUpdate != AlignOnUpdate.never) {
                            setState(
                              () =>
                                  _alignPositionOnUpdate = AlignOnUpdate.never,
                            );
                          }
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
                        CurrentLocationLayer(
                          alignPositionStream:
                              _alignPositionStreamController.stream,
                          alignPositionOnUpdate: _alignPositionOnUpdate,
                        )
                      ]),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () => _alignPositionOnUpdate = AlignOnUpdate.always,
            );
            _alignPositionStreamController.add(13);
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.gps_fixed,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartTop);
  }
}
