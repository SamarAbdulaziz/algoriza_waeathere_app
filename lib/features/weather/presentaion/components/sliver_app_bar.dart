import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';

class WeatherSliverAppBar extends StatelessWidget {


  String currentDay = DateFormat('EEE').format(DateTime.now());
  String currentTime = DateFormat.jm().format(DateTime.now());

  WeatherSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 3,
      backgroundColor: AppColors.blueAppColor,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: BlocBuilder<NewWeatherCubit, NewWeatherStates>(
        builder: (context, state) {
          if (state is NewWeatherLoadedState) {
            return FlexibleSpaceBar(
              title: Row(
                children: [
                  Text(
                    state.newWeather.location.name,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.location_on,
                  color: Colors.white,
                )
              ],
            ),
            collapseMode: CollapseMode.none,
            background: Container(
              margin:
              const EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                      children: [
                        Text(
                          '${state.newWeather.current.tempC}\u2103',
                          style: const TextStyle(
                            fontSize: 60.0,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Image.network('https:${state.newWeather.current.icon}')
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      '${state.newWeather.forecast.forecastDay[0].day.maxtempC}\u00BA'
                      '/${state.newWeather.forecast.forecastDay[0].day.mintempC}\u00BA '
                      'Feels Like ${state.newWeather.current.feelslikeC}\u00BA',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$currentDay,$currentTime',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
            ),
          );}
          else if (state is NewWeatherErrorState) {
            return Text(state.errorMessage);
          } else {
            return  Container();
          }

        },
      ),
    );
  }
}