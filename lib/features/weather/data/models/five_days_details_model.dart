import 'package:weather/features/weather/domain/entities/five_days_details.dart';

class FiveDaysDetailsModel extends FiveDaysDetails {
  const FiveDaysDetailsModel({
    required final int temp,
    required final int feelsLike,
    required final int minTemp,
    required final int maxTemp,
    required final int pressure,
    required final int humidity,
    required final String mainDescription,
    required final String description,
    required final String icon,
    required final int windSpeed,
    required final String dateTime,
    required final int pop,
  }) : super(
    temp: temp,
    feelsLike: feelsLike,
    minTemp: minTemp,
    maxTemp: maxTemp,
    pressure: pressure,
    humidity: humidity,
    mainDescription: mainDescription,
    description: description,
    icon: icon,
    windSpeed: windSpeed,
    dateTime: dateTime,
    pop: pop,
  );

  factory FiveDaysDetailsModel.fromJson(Map<String, dynamic> json) {
    return FiveDaysDetailsModel(
      temp: json['main']['temp'].round(),
      feelsLike: json['main']['feels_like'].round(),
      minTemp: json['main']['temp_min'].round(),
      maxTemp: json['main']['temp_max'].round(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      mainDescription: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      windSpeed: (json['wind']['speed']*3.6).round(),
      dateTime: json['dt_txt'],
      pop: (json['pop']*100).round(),
    );
  }
}
