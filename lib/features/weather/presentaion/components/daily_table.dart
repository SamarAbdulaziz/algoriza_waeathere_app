import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';

class DailyTable extends StatelessWidget {

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
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              itemCount: list.length,
              itemBuilder: (context, index) {
                var item = list[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          item.dtDay,
                        ),
                        Text('${item.day.dailyChanceOfRain}% '),
                        const Icon(
                          Icons.circle,
                          color: Colors.yellow,
                        ),
                        const Icon(
                          Icons.dark_mode,
                          color: Colors.yellow,
                        ),
                        Text('${item.day.maxtempC}\u00BA'),
                        Text('${item.day.mintempC}\u00BA'),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                  ],
                );
              },
            ),
          );
        }
        else {
          return const SizedBox();
        }
      },
    );
  }
}
