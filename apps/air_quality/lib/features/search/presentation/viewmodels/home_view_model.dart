import 'package:air_quality/features/home/data/model/aqi_dto.dart';
import 'package:air_quality/features/home/domain/entities/aqi.dart';
import 'package:air_quality/features/home/domain/ports/aqi/services.dart';
import 'package:air_quality/features/search/presentation/viewmodels/home_state.dart';
import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  IAQIService service = getIt.get<IAQIService>();
  final defaultDew = Dew(v: null);

  @override
  HomeState build() => HomeState(
      loading: false,
      aqiToDisplay: AqiToDisplay(
          stationName: '',
          forecastPM25: [],
          aqiList: Iaqi(
            dew: defaultDew,
            h: defaultDew,
            no2: defaultDew,
            o3: defaultDew,
            p: defaultDew,
            pm10: defaultDew,
            pm25: defaultDew,
            so2: defaultDew,
            t: defaultDew,
            w: defaultDew,
            wg: defaultDew,
          )));

  void getCurrentAqiDetail(LatLng latLng) async {
    state = state.copyWith(loading: true);

    final response = await service.getAqiDetailByLatLng(latLng);

    state = state.copyWith(
        loading: false,
        aqiToDisplay: response,
    );
  }
}
