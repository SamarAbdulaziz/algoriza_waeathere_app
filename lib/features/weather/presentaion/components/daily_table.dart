import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';

class DailyTable extends StatelessWidget {
  String currentDay = DateFormat('EEEE').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewWeatherCubit, NewWeatherStates>(
      builder: (context, state) {
        if (state is NewWeatherLoadedState) {
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
                        SizedBox(
                          width: 85.0,
                          child: Text(
                            item.dtDay == currentDay ? 'Today' : item.dtDay,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.water_drop,
                              size: 14,
                              color: Colors.white60,
                            ),
                            Text('${item.day.dailyChanceOfRain}% '),
                          ],
                        ),
                        Image.network(
                          'https:${item.day.icon}',
                          scale: 1.7,
                        ),
                        const Icon(
                          Icons.dark_mode,
                          color: Colors.yellow,
                        ),
                        Text(
                          '${item.day.maxtempC}\u00BA',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${item.day.mintempC}\u00BA',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                  ],
                );
              },
            ),
          );
        } else if (state is NewWeatherErrorState) {
          return Text(state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
