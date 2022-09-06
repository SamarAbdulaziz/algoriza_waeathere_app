import 'package:dartz/dartz.dart';
import 'package:weather/core/base_use_cases/base_use_case.dart';
import 'package:weather/core/errors/failure.dart';
import 'package:weather/features/weather/domain/entities/five_days_weather.dart';
import 'package:weather/features/weather/domain/repository/base_weather_repository.dart';

class GetWeatherDetailsByCityNameUseCase extends BaseUseCase<FiveDaysWeather, String> {
  BaseWeatherRepository baseWeatherRepository;

  GetWeatherDetailsByCityNameUseCase(this.baseWeatherRepository);

  @override
  Future<Either<Failure, FiveDaysWeather>> call(String parameter) async {
    return await baseWeatherRepository.getWeatherDetailsByCityName(parameter);
  }
  // Future<Weather> call(String parameter) async {
  //   return await baseWeatherRepository.getWeatherByCityName(parameter);
  // }
}
