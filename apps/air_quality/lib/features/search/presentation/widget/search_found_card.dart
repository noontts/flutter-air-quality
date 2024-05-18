import 'package:air_quality/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:core_libs/utils/air_quality_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class SearchFoundCard extends ConsumerWidget {
  const SearchFoundCard(
      {super.key,
      required this.location,
      required this.aqi,
      required this.latLng,
      required this.stationId});

  final String location;
  final int aqi;
  final int stationId;
  final LatLng latLng;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textcolor = aqiToColor(aqi);
    final homeNotifier = ref.read(homeViewModelProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: () {
          homeNotifier.getCurrentAqiDetailById(stationId);
          context.pop();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          width: 350,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  child: Text(
                    location,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('$aqi',
                        style: TextStyle(
                          color: textcolor,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.black.withOpacity(0.55),
                            ),
                          ],
                        )),
                    const Text(
                      'AQI',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
