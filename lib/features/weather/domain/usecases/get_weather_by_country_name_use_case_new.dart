
import 'package:dartz/dartz.dart';
import 'package:weather/core/base_use_cases/base_use_case.dart';
import 'package:weather/core/errors/failure.dart';
import 'package:weather/features/weather/domain/entities/new_weather.dart';
import 'package:weather/features/weather/domain/repository/base_weather_repository_new.dart';

class GetWeatherByCityNameUseCaseNew extends BaseUseCase<NewWeather, String> {
  BaseWeatherRepositoryNew baseWeatherRepositoryNew;

  GetWeatherByCityNameUseCaseNew(this.baseWeatherRepositoryNew);

  @override
  Future<Either<Failure, NewWeather>> call(String parameter) async {
    return await baseWeatherRepositoryNew.getWeatherByCityName(parameter);
  }
  // Future<Weather> call(String parameter) async {
  //   return await baseWeatherRepository.getWeatherByCityName(parameter);
  // }
}
