// import 'package:dartz/dartz.dart';
// import 'package:weather/core/base_use_cases/base_use_case.dart';
// import 'package:weather/core/errors/failure.dart';
// import 'package:weather/features/weather/domain/entities/weather.dart';
// import 'package:weather/features/weather/domain/repository/base_weather_repository.dart';
//
// class GetWeatherByCityNameUseCase extends BaseUseCase<Weather, String> {
//   BaseWeatherRepository baseWeatherRepository;
//
//   GetWeatherByCityNameUseCase(this.baseWeatherRepository);
//
//   @override
//   Future<Either<Failure, Weather>> call(String parameter) async {
//     return await baseWeatherRepository.getWeatherByCityName(parameter);
//   }
//   // Future<Weather> call(String parameter) async {
//   //   return await baseWeatherRepository.getWeatherByCityName(parameter);
//   // }
// }
