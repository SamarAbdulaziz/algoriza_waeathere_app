import 'package:get_it/get_it.dart';
import 'package:weather/features/weather/data/dataSource/remote_datasource_new.dart';
import 'package:weather/features/weather/data/repository/weather_repository_new.dart';
import 'package:weather/features/weather/domain/repository/base_weather_repository_new.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_by_country_name_use_case_new.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';

final sl = GetIt.instance;

class NewServiceLocator {
  void init() {
    ///Data
    sl.registerLazySingleton<BaseRemoteDataSourceNew>(() => RemoteDataSourceNew());

    ///Repo
    sl.registerLazySingleton<BaseWeatherRepositoryNew>(
        () => WeatherRepositoryNew(sl()));

    ///UseCases
    sl.registerLazySingleton<GetWeatherByCityNameUseCaseNew>(
        () => GetWeatherByCityNameUseCaseNew(sl()));

    ///Bloc-cubit
    sl.registerFactory<NewWeatherCubit>(() => NewWeatherCubit(sl()));
  }
}
