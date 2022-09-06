import 'package:flutter/material.dart';
import 'package:weather/features/weather/presentaion/components/hourly__temperature_component.dart';
import 'package:weather/features/weather/presentaion/components/my_drawer.dart';
import 'package:weather/features/weather/presentaion/components/sliver_app_bar.dart';
import 'package:weather/features/weather/presentaion/components/sunrise_sunset_component.dart';
import 'package:weather/features/weather/presentaion/components/uv_wind_humidity_component.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.black87,
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoadedState) {
            return CustomScrollView(
              slivers: [
                WeatherSliverAppBar(
                  cityName: state.weather.cityName,
                  temp: state.weather.temp,
                  maxTemp: state.weather.maxTemp,
                  minTemp: state.weather.minTemp,
                  feelsLike: state.weather.feelsLike,
                ),
                SliverList(
                  //like listview.builder
                  delegate: SliverChildListDelegate(
                    [
                      const HourlyTemperatureComponent(),
                      Column(
                        children: [
                          SunriseSunsetComponent(
                              sunrise: state.weather.sunrise,
                              sunset: state.weather.sunset),
                          UvWindHumidityComponent(
                            windSpeed: state.weather.windSpeed,
                            humidity: state.weather.humidity,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          } else if (state is WeatherErrorState) {
            return Text(state.errorMessage);
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}