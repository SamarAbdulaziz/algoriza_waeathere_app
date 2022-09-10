import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/errors/exceptions.dart';
import 'package:weather/core/errors/failure.dart';
import 'package:weather/features/weather/data/dataSource/remote_datasource_new.dart';
import 'package:weather/features/weather/domain/entities/new_weather.dart';
import 'package:weather/features/weather/domain/repository/base_weather_repository_new.dart';

class WeatherRepositoryNew implements BaseWeatherRepositoryNew {
  final BaseRemoteDataSourceNew baseRemoteDataSourceNew;

  WeatherRepositoryNew(this.baseRemoteDataSourceNew);

  @override
  Future<Either<Failure, NewWeather>> getWeatherByCityName(String cityName) async{
  final result =await baseRemoteDataSourceNew.getWeatherByCityName(cityName);
  try{
    // debugPrint(result.cityName);
    // debugPrint(result.temp.toString());
    // debugPrint(result.minTemp.toString());
    // debugPrint(result.maxTemp.toString());
   return Right(result);
  }on ServerException catch(failure){
    debugPrint(failure.errorModel.message);

    return Left(ServerFailure(failure.errorModel.message));
    }
  }

  // @override
  // Future<Either<Failure, NewWeather>> getWeatherByCoordinates(double lat, double long) async {
  //   final result =await baseRemoteDataSourceNew.getWeatherByCoordinates(lat,long);
  //   try{
  //     // debugPrint(result.cityName);
  //     // debugPrint(result.temp.toString());
  //     // debugPrint(result.minTemp.toString());
  //     // debugPrint(result.maxTemp.toString());
  //     return Right(result);
  //   }on ServerException catch(failure){
  //     debugPrint(failure.errorModel.message);
  //
  //     return Left(ServerFailure(failure.errorModel.message));
  //   }
  // }

}
