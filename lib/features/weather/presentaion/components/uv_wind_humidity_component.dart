import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';

class UvWindHumidityComponent extends StatelessWidget {
  const UvWindHumidityComponent({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewWeatherCubit, NewWeatherStates>(
      builder: (context, state) {
        if (state is NewWeatherLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewWeatherLoadedState) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: AppColors.whiteWithOpacity,
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      child: const Icon(
                        Icons.circle,
                        color: Colors.yellow,
                        size: 40.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                    ),
                    const Text(
                      'UV index',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      //todo
                      'High',
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey,
                  height: 100,
                  width: 0.1,
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.air,
                      color: Colors.grey,
                      size: 40.0,
                    ),
                    const Text(
                      'Wind',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${state.newWeather.current.windKph}km/h',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey,
                  height: 100,
                  width: 0.1,
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.water_drop,
                      color: Colors.lightBlueAccent,
                      size: 45.0,
                    ),
                    const Text(
                      'Humidity',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${state.newWeather.current.humidity}%',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
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
