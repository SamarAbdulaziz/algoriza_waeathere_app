import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/components/daily_table.dart';
import 'package:weather/features/weather/presentaion/components/hourly__temperature_component.dart';
import 'package:weather/features/weather/presentaion/components/my_drawer.dart';
import 'package:weather/features/weather/presentaion/components/sliver_app_bar.dart';
import 'package:weather/features/weather/presentaion/components/sunrise_sunset_component.dart';
import 'package:weather/features/weather/presentaion/components/uv_wind_humidity_component.dart';

class WeatherScreen extends StatelessWidget {
  final String selectedDay = DateFormat('EEE').format(DateTime.now());
  final String currentTime = DateFormat.jm().format(DateTime.now());

  WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  MyDrawer(),
      backgroundColor: AppColors.blueAppColor,
      body: CustomScrollView(
        slivers: [
          WeatherSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                 const HourlyTemperatureComponent(),
                 DailyTable(),
                 SunriseSunsetComponent(),
                 const UvWindHumidityComponent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
