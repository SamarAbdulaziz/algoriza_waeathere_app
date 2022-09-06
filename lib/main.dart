import 'package:flutter/material.dart';
import 'package:weather/core/services/service_locator.dart';
import 'package:weather/features/weather/data/dataSource/remote_datasource.dart';
import 'package:weather/features/weather/data/repository/weather_repository.dart';
import 'package:weather/features/weather/domain/repository/base_weather_repository.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_by_country_name_use_case.dart';
import 'my_app.dart';

void main() async {
  ServiceLocator().init();
  runApp(const WeatherApp());
}


//WidgetsFlutterBinding.ensureInitialized();

// BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
// BaseWeatherRepository baseWeatherRepository =
// WeatherRepository(baseRemoteDataSource);
// var weather = GetWeatherByCityNameUseCase(baseWeatherRepository)('alexandria');

//print(weather);
// //usecase                    data_repo     datasource
//GetWeatherByCityName(WeatherRepository(RemoteDataSource()));
