
import 'package:weather/features/weather/domain/entities/new_weather.dart';

abstract class NewWeatherStates{}

class NewWeatherInitialState extends NewWeatherStates {}

class NewWeatherLoadingState extends NewWeatherStates {}

class NewWeatherLoadedState extends NewWeatherStates {
  final NewWeather newWeather;

  NewWeatherLoadedState({required this.newWeather});
}

class NewWeatherErrorState extends NewWeatherStates {
  final String errorMessage;

  NewWeatherErrorState({required this.errorMessage});
}


