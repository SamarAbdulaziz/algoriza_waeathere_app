import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int code;
  final int id;
  final String cityName;
  final String mainDescription;
  final String description;
  final String icon;
  final int temp;
  final int feelsLike;
  final int minTemp;
  final int maxTemp;
  final int pressure;
  final int humidity; //(%)
  final int windSpeed;
  final String sunrise;
  final String sunset;

  const Weather({
    required this.code,
    required this.id,
    required this.cityName,
    required this.mainDescription,
    required this.description,
    required this.icon,
    required this.temp,
    required this.feelsLike,
    required this.minTemp,
    required this.maxTemp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object> get props =>
      [
        code,
        id,
        cityName,
        mainDescription,
        description,
        icon,
        temp,
        feelsLike,
        minTemp,
        maxTemp,
        pressure,
        humidity,
        windSpeed,
        sunrise,
        sunset,
      ];
}
