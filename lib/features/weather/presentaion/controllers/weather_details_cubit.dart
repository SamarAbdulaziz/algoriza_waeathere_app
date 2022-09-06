import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:weather/features/weather/domain/entities/five_days_weather.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_details_state.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/usecases/get_weather_details_by_country_name_use_case.dart';

class WeatherDetailsCubit extends Cubit<WeatherDetailsStates> {
  final GetWeatherDetailsByCityNameUseCase getWeatherDetailsByCityNameUseCase;

  WeatherDetailsCubit(
    this.getWeatherDetailsByCityNameUseCase,
  ) : super(WeatherDetailsInitialState());

  Future<void> getWeatherDetailsByCityName(String cityName) async {
    Either<Failure, FiveDaysWeather> response =
        await getWeatherDetailsByCityNameUseCase(cityName);
    response.fold(
        (failure) =>
            emit(WeatherDetailsErrorState(errorMessage: failure.massage)),
        (fiveDaysWeather) =>
            emit(WeatherDetailsLoadedState(fiveDaysWeather: fiveDaysWeather)));
  }

}
