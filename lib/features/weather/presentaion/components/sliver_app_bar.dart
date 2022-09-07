import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_cubit.dart';

class WeatherSliverAppBar extends StatefulWidget {
  WeatherSliverAppBar({Key? key}) : super(key: key);

  @override
  State<WeatherSliverAppBar> createState() => _WeatherSliverAppBarState();
}

class _WeatherSliverAppBarState extends State<WeatherSliverAppBar> {
  String selectedDay = DateFormat('EEE').format(DateTime.now());
  String currentTime = DateFormat.jm().format(DateTime.now());

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getWeatherByCityName('Alexandria');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        if (state is WeatherInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoadedState) {
          return SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 3,
            backgroundColor: AppColors.blueAppColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: [
                  Text(
                    '${state.weather.cityName}',
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
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
                          '${state.weather.temp}\u2103',
                          style: const TextStyle(
                            fontSize: 60.0,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.sunny,
                          size: 80.0,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      '${state.weather.maxTemp}\u00BA/${state.weather.minTemp}\u00BA Feels Like ${state.weather.feelsLike}\u00BA',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$selectedDay,$currentTime',
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is WeatherErrorState) {
          return Text(state.errorMessage);
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}