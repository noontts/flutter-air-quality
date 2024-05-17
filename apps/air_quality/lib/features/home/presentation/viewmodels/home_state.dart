import 'package:air_quality/features/home/domain/entities/aqi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required bool loading,
    required AqiToDisplay aqiToDisplay,
  }) = _HomeState;
}