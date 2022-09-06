import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_details_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_details_state.dart';

class HourlyTemperatureComponent extends StatelessWidget {
  const HourlyTemperatureComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherDetailsCubit, WeatherDetailsStates>(
      builder: (context, state) {
        if (state is WeatherDetailsLoadingState) {
          return const SizedBox(
            height: 100,
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherDetailsLoadedState) {
          var list = state.fiveDaysWeather.listOfFiveDays;
          return SizedBox(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (context, index) => Column(
                children: [
                  // Text(list[index].dateTime),
                  const Icon(Icons.sunny),
                  const Text('34deg'),
                  //humidity
                  const Text('0%'),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox(
            height: 100,
          );
        }
      },
    );
  }
}
