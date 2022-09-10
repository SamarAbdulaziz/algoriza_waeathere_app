import 'package:dartz/dartz.dart';
import 'package:weather/core/errors/failure.dart';
import 'package:weather/features/weather/domain/entities/new_weather.dart';

abstract class BaseWeatherRepositoryNew{
  Future<Either<Failure, NewWeather>>getWeatherByCityName(String cityName);
  // Future<Either<Failure, NewWeather>>getWeatherByCoordinates(double lat,double long);
}
