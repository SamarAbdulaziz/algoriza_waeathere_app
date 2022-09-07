import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_cubit.dart';

class SunriseSunsetComponent extends StatefulWidget {
  const SunriseSunsetComponent({Key? key}) : super(key: key);

  @override
  State<SunriseSunsetComponent> createState() => _SunriseSunsetComponentState();
}

class _SunriseSunsetComponentState extends State<SunriseSunsetComponent> {
  @override
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
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: AppColors.whiteWithOpacity,
                borderRadius: BorderRadius.circular(20.0)),
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
                      state.weather.sunrise,
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
                      state.weather.sunset,
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
