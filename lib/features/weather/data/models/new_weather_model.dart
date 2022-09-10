import 'package:weather/features/weather/data/models/current_model.dart';
import 'package:weather/features/weather/data/models/forcast_model.dart';
import 'package:weather/features/weather/data/models/location_model.dart';
import 'package:weather/features/weather/domain/entities/current.dart';
import 'package:weather/features/weather/domain/entities/forcast.dart';
import 'package:weather/features/weather/domain/entities/location.dart';
import 'package:weather/features/weather/domain/entities/new_weather.dart';

class NewWeatherModel extends NewWeather {
  NewWeatherModel(
      {required final Location location,
      required final Current current,
      required final Forecast forecast})
      : super(
          location: location,
          current: current,
          forecast: forecast,
        );

  factory NewWeatherModel.fromJson(Map<String, dynamic> json) =>
      NewWeatherModel(
        location: LocationModel.fromJson(json["location"]),
        current: CurrentModel.fromJson(json["current"]),
        forecast: ForecastModel.fromJson(json["forecast"]),
      );
}
