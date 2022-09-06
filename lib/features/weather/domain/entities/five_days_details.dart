import 'package:equatable/equatable.dart';

class FiveDaysDetails extends Equatable {
  final int temp;
  final int feelsLike;
  final int minTemp;
  final int maxTemp;
  final int pressure;
  final int humidity; //(%)
  final String mainDescription;
  final String description;
  final String icon;
  final int windSpeed;
  final String dateTime;

  const FiveDaysDetails({
    required this.temp,
    required this.feelsLike,
    required this.minTemp,
    required this.maxTemp,
    required this.pressure,
    required this.humidity,
    required this.mainDescription,
    required this.description,
    required this.icon,
    required this.windSpeed,
    required this.dateTime,
  });

  @override
  List<Object> get props =>
      [
        temp,
        feelsLike,
        minTemp,
        maxTemp,
        pressure,
        humidity,
        mainDescription,
        description,
        icon,
        windSpeed,
        dateTime,
      ];
}
