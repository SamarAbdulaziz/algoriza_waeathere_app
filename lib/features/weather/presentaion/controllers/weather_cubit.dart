// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:weather/features/weather/domain/usecases/get_weather_by_country_name_use_case.dart';
// import '../../../../core/errors/failure.dart';
// import '../../domain/entities/weather.dart';
//
// part 'weather_state.dart';
//
// class WeatherCubit extends Cubit<WeatherStates> {
//   final GetWeatherByCityNameUseCase getWeatherByCityNameUseCase;
//
//   WeatherCubit(
//     this.getWeatherByCityNameUseCase,
//   ) : super(WeatherInitialState());
//
//   Future<void> getWeatherByCityName(String cityName) async {
//     Either<Failure, Weather> response =
//         await getWeatherByCityNameUseCase(cityName);
//     response.fold(
//         (failure) => emit(WeatherErrorState(errorMessage: failure.massage)),
//         (weather) => emit(WeatherLoadedState(weather: weather)));
//   }
//
//
//
//   TextEditingController searchController = TextEditingController();
// }
