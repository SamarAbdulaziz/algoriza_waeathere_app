import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entities/current.dart';
import 'package:weather/features/weather/domain/entities/forcast.dart';
import 'package:weather/features/weather/domain/entities/location.dart';

class NewWeather extends Equatable {
  final Location location;
  final Current current;
  final Forecast forecast;

  NewWeather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  @override
  List<Object> get props => [location, current, forecast];
}
