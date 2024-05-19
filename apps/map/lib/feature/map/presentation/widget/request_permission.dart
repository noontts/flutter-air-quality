import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';

class RequestPermissionGPS extends StatelessWidget {
  final Function checkPermission;
  const RequestPermissionGPS({super.key, required this.checkPermission});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotties/no-permission-map.json'),
          const Text(
            'Allow your location',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          const Text('We will use your location to use this feature!'),
          const SizedBox(height: 30),
          TextButton(
              onPressed: () async{
                await Geolocator.openLocationSettings();
                checkPermission();
              },
              child: const Text('Sure')),
        ],
      ),
    );
  }
}
