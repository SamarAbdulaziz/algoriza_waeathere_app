import 'package:weather/features/weather/domain/entities/five_days_weather.dart';

abstract class WeatherDetailsStates {}

class WeatherDetailsInitialState extends WeatherDetailsStates {}

class WeatherDetailsLoadingState extends WeatherDetailsStates {}

class WeatherDetailsLoadedState extends WeatherDetailsStates {
  final FiveDaysWeather fiveDaysWeather;

  WeatherDetailsLoadedState({required this.fiveDaysWeather});
}

class WeatherDetailsErrorState extends WeatherDetailsStates {
  final String errorMessage;

  WeatherDetailsErrorState({required this.errorMessage});
}
