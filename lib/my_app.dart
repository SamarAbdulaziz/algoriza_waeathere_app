import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/services/new_service_locator.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/screens/weather_screen.dart';


class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            sl<NewWeatherCubit>()
       ..getWeatherByCityName('Alexandria'),
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
        home:  WeatherScreen(),
      ),
    );
  }
}
// TextTheme = Theme.of(context).textTheme.apply(
// bodyColor: Colors.pink,
// displayColor: Colors.pink,
// );
