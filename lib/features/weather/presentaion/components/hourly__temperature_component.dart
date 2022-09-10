import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/components/hourly_chart.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';

class HourlyTemperatureComponent extends StatelessWidget {
  const HourlyTemperatureComponent({Key? key}) : super(key: key);

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
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: list[0].hour.length,
                    itemBuilder: (context, index) {
                      var item = list[0]; //list[1]
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //  String currentTime = DateFormat.jm().format(DateTime.now());
                            //todo edit to start by the hour of now
                            Text(
                              item.hour[index].timeEpoch,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              'https:${item.hour[index].icon}',
                              scale: 1.6,
                            ),

                            Text(
                              '${item.hour[index].tempC}\u00BA',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.water_drop,
                                  size: 14,
                                  color: Colors.white60,
                                ),
                                Text('${item.hour[index].chanceOfRain}%'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const HourlyChart(),
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
