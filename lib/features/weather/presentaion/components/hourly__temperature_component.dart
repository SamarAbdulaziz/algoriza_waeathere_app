import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_details_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_details_state.dart';

class HourlyTemperatureComponent extends StatefulWidget {
  const HourlyTemperatureComponent({Key? key}) : super(key: key);

  @override
  State<HourlyTemperatureComponent> createState() =>
      _HourlyTemperatureComponentState();
}

class _HourlyTemperatureComponentState
    extends State<HourlyTemperatureComponent> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherDetailsCubit>(context)
        .getWeatherDetailsByCityName('Alexandria');
  }

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
          // var hour= list[0].dateTime.split(' ')[1].split(':')[0];
          print(list[0]);

          return Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: AppColors.whiteWithOpacity,
                borderRadius: BorderRadius.circular(20.0)),
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (context, index) {
                var hour = list[index].dateTime.split(' ')[1].split(':')[0];
                var item = list[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$hour pm'),
                      const Icon(Icons.sunny),
                      Text('${item.maxTemp}\u00BA'),
                      const Text('.......'),
                      Text('${item.pop}%'),
                    ],
                  ),
                );
              },
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
