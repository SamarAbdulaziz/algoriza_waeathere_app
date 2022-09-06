import 'package:dartz/dartz.dart';
import 'package:weather/core/errors/failure.dart';
import 'package:weather/features/weather/domain/entities/five_days_weather.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, Weather>>getWeatherByCityName(String cityName);
  Future<Either<Failure, FiveDaysWeather>>getWeatherDetailsByCityName(String cityName);
}
