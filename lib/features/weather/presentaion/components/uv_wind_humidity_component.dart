import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_cubit.dart';

class UvWindHumidityComponent extends StatefulWidget {
  const UvWindHumidityComponent({Key? key}) : super(key: key);

  @override
  State<UvWindHumidityComponent> createState() => _UvWindHumidityComponentState();
}

class _UvWindHumidityComponentState extends State<UvWindHumidityComponent> {
  void initState() {
    BlocProvider.of<WeatherCubit>(context).getWeatherByCityName('Alexandria');
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        if (state is WeatherInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoadedState) {
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
                      '${state.weather.windSpeed}km/h',
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
                      '${state.weather.humidity}%',
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
