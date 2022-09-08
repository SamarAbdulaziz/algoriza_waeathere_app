import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';

class HourlyTemperatureComponent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewWeatherCubit, NewWeatherStates>(
      builder: (context, state) {
        if (state is NewWeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewWeatherLoadedState) {
          var list = state.newWeather.forecast.forecastDay;
          return Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: AppColors.whiteWithOpacity,
                borderRadius: BorderRadius.circular(20.0)),
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list[0].hour.length,
              itemBuilder: (context, index) {
                var item = list[0];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.hour[index].timeEpoch),
                      const Icon(Icons.sunny),
                      Text('${item.day.maxtempC}\u00BA'),
                      const Text('.......'),
                      Text('${item.day.dailyChanceOfRain}%'),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
