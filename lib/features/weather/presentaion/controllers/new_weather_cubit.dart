
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:weather/core/errors/failure.dart';
import 'package:weather/features/weather/domain/entities/new_weather.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_by_country_name_use_case_new.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';

class NewWeatherCubit extends Cubit<NewWeatherStates> {
  final GetWeatherByCityNameUseCaseNew getWeatherByCityNameUseCaseNew;
  // final GetWeatherByCoordinatesUseCaseNew getWeatherByCoordinatesUseCaseNew;

  NewWeatherCubit(
    this.getWeatherByCityNameUseCaseNew,
  ) : super(NewWeatherInitialState());

  Future<void> getWeatherByCityName(String cityName) async {
    emit(NewWeatherLoadingState());//to let the circular progress indecator show up
    Either<Failure, NewWeather> response =
        await getWeatherByCityNameUseCaseNew(cityName);
    response.fold(
        (failure) => emit(NewWeatherErrorState(errorMessage: failure.massage)),
        (newWeather) => emit(NewWeatherLoadedState(newWeather: newWeather)));
  }
 //
 // Future<void> getWeatherByCoordinates( double lat,  double long) async {
 //    emit(NewWeatherLoadingState());//to let the circular progress indecator show up
 //    Either<Failure, NewWeather> response =
 //        await getWeatherByCoordinatesUseCaseNew(lat,long);
 //    response.fold(
 //        (failure) => emit(NewWeatherErrorState(errorMessage: failure.massage)),
 //        (newWeather) => emit(NewWeatherLoadedState(newWeather: newWeather)));
 //  }
 //

}
