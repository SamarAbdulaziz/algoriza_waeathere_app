import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_details_cubit.dart';
import 'package:weather/features/weather/presentaion/screens/weather_screen.dart';

import 'core/services/service_locator.dart';
import 'features/weather/presentaion/controllers/weather_cubit.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<WeatherCubit>()..getWeatherByCityName('Alexandria'),
          //..getWeatherDetailsByCityNameUseCase('Alexandria'),
        ),
        BlocProvider(
          create: (context) => sl<WeatherDetailsCubit>()
            ..getWeatherDetailsByCityNameUseCase('Alexandria'),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        home: const WeatherScreen(),
      ),
    );
  }
}
// TextTheme = Theme.of(context).textTheme.apply(
// bodyColor: Colors.pink,
// displayColor: Colors.pink,
// );
