import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/errors/error_model.dart';
import 'package:weather/core/errors/exceptions.dart';
import 'package:weather/core/utiles/constants.dart';
import 'package:weather/features/weather/data/models/five_days_weather_model.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';


abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherByCityName(String cityName);

  Future<FiveDayWeatherModel> getWeatherDetailsByCityName(String cityName);
}


class RemoteDataSource implements BaseRemoteDataSource {

  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    var dio = Dio();
    final response =
        await dio.get(AppConstants.getWeatherByCityNamePath(cityName));
    //debugPrint(response.data);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }


  @override
  Future<FiveDayWeatherModel> getWeatherDetailsByCityName(String cityName) async {
    var dio = Dio();
    final response =
        await dio.get(AppConstants.getWeatherDetailsByCityNamePath(cityName));
    //debugPrint(response.data);
    if (response.statusCode == 200) {
      return FiveDayWeatherModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
