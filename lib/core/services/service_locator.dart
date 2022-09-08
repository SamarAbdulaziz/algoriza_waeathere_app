// import 'package:get_it/get_it.dart';
// import 'package:weather/features/weather/data/dataSource/remote_datasource.dart';
// import 'package:weather/features/weather/data/repository/weather_repository.dart';
// import 'package:weather/features/weather/domain/repository/base_weather_repository.dart';
// import 'package:weather/features/weather/domain/usecases/get_weather_by_country_name_use_case.dart';
// import 'package:weather/features/weather/domain/usecases/get_weather_details_by_country_name_use_case.dart';
// import 'package:weather/features/weather/presentaion/controllers/weather_cubit.dart';
//
// import '../../features/weather/presentaion/controllers/weather_details_cubit.dart';
//
// final sl = GetIt.instance;
//
// class ServiceLocator {
//   void init() {
//     ///Data
//     sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
//
//     ///Repo
//     sl.registerLazySingleton<BaseWeatherRepository>(
//         () => WeatherRepository(sl()));
//
//     ///UseCases
//     sl.registerLazySingleton<GetWeatherByCityNameUseCase>(
//         () => GetWeatherByCityNameUseCase(sl()));
//     sl.registerLazySingleton<GetWeatherDetailsByCityNameUseCase>(
//         () => GetWeatherDetailsByCityNameUseCase(sl()));
//
//     ///Bloc-cubit
//     sl.registerFactory<WeatherCubit>(() => WeatherCubit(sl()));
//     sl.registerFactory<WeatherDetailsCubit>(() => WeatherDetailsCubit(sl()));
//   }
// }
