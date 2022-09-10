// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:weather/core/errors/exceptions.dart';
// import 'package:weather/core/errors/failure.dart';
// import 'package:weather/features/weather/data/dataSource/remote_datasource.dart';
// import 'package:weather/features/weather/domain/entities/five_days_weather.dart';
// import 'package:weather/features/weather/domain/entities/weather.dart';
// import 'package:weather/features/weather/domain/repository/base_weather_repository.dart';
//
// class WeatherRepository implements BaseWeatherRepository {
//   final BaseRemoteDataSource baseRemoteDataSource;
//
//   WeatherRepository(this.baseRemoteDataSource);
//
//   @override
//   Future<Either<Failure, Weather>> getWeatherByCityName(String cityName) async{
//   final result =await baseRemoteDataSource.getWeatherByCityName(cityName);
//   try{
//     // debugPrint(result.cityName);
//     // debugPrint(result.temp.toString());
//     // debugPrint(result.minTemp.toString());
//     // debugPrint(result.maxTemp.toString());
//    return Right(result);
//   }on ServerException catch(failure){
//     debugPrint(failure.errorModel.message);
//
//     return Left(ServerFailure(failure.errorModel.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, FiveDaysWeather>> getWeatherDetailsByCityName(String cityName) async{
//     final result =await baseRemoteDataSource.getWeatherDetailsByCityName(cityName);
//     try{
//       debugPrint(result.cityName);
//       debugPrint(result.country);
//       debugPrint(result.listOfFiveDays[0].dateTime.toString());
//
//       // debugPrint(result.minTemp.toString());
//       // debugPrint(result.maxTemp.toString());
//       return Right(result);
//     }on ServerException catch(failure){
//       debugPrint(failure.errorModel.message);
//
//       return Left(ServerFailure(failure.errorModel.message));
//     }
//   }
//
// }
