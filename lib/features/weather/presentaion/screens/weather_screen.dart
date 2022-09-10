import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/components/daily_table.dart';
import 'package:weather/features/weather/presentaion/components/hourly__temperature_component.dart';
import 'package:weather/features/weather/presentaion/components/my_drawer.dart';
import 'package:weather/features/weather/presentaion/components/sliver_app_bar.dart';
import 'package:weather/features/weather/presentaion/components/sunrise_sunset_component.dart';
import 'package:weather/features/weather/presentaion/components/uv_wind_humidity_component.dart';

class WeatherScreen extends StatefulWidget {

  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String selectedDay = DateFormat('EEE').format(DateTime.now());

  final String currentTime = DateFormat.jm().format(DateTime.now());

  ScrollController scrollController = ScrollController();
  Color _backgroundColor=AppColors.blueAppColor;
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     scrollController.addListener(() {
//      // print (scrollController.position.pixels);
//       scrollController.animateTo(60, duration: Duration(microseconds: 300), curve: Curves.easeIn);
//       if (scrollController.position.pixels>60){
//         setState(() {
//          _backgroundColor=Colors.black45;
//
//         });
//       }else{
//         _backgroundColor=AppColors.blueAppColor;
//       }
//     });
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     scrollController.dispose();
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: const MyDrawer(),
      backgroundColor:_backgroundColor,
      body: CustomScrollView(
        controller:scrollController,
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
