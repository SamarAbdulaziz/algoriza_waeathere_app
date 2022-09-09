import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';

import '../controllers/new_weather_state.dart';

class SunriseSunsetComponent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewWeatherCubit, NewWeatherStates>(
      builder: (context, state) {
         if (state is NewWeatherLoadedState) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: AppColors.whiteWithOpacity,
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Sunrise',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      state.newWeather.forecast.forecastDay[0].astro.sunrise,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const Icon(
                      Icons.sunny_snowing,
                      color: Colors.yellow,
                      size: 60.0,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Sunset',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      state.newWeather.forecast.forecastDay[0].astro.sunset,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const Icon(
                      Icons.sunny_snowing,
                      color: Colors.red,
                      size: 60.0,
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is NewWeatherErrorState) {
          return Text(state.errorMessage);
        } else {
          return Container();
        }
      },
    );
  }
}
