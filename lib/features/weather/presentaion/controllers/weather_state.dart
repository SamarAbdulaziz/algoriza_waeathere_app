part of 'weather_cubit.dart';

abstract class WeatherStates{}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final Weather weather;

  WeatherLoadedState({required this.weather});
}

class WeatherErrorState extends WeatherStates {
  final String errorMessage;

  WeatherErrorState({required this.errorMessage});
}


