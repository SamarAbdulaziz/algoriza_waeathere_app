import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_cubit.dart';

class WeatherSliverAppBar extends StatelessWidget {
  final String cityName;
  final int temp;
  final int maxTemp;
  final int minTemp;
  final int feelsLike;

  WeatherSliverAppBar({
    Key? key,
    required this.cityName,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.feelsLike,
  }) : super(key: key);
  String selectedDay = DateFormat('EEE').format(DateTime.now());
  String currentTime = DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        //todo
        return SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height / 3,
          //300
          pinned: true,
          stretch: true,
          floating: true,
          backgroundColor: AppColors.blueAppColor,
          //title: Text('City Name'),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              cityName,
            ),
            //expandedTitleScale:2 ,
            //stretchModes: [StretchMode.fadeTitle],
            background: Container(
              margin:
                  const EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${temp}\u2103',
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
                  // Row(
                  //   children: const [
                  //     Text(
                  //       //todo
                  //       'City Name',
                  //       style: TextStyle(
                  //         fontSize: 25.0,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     Icon(
                  //       Icons.location_on,
                  //       color: Colors.white,
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 25.0,
                  // ),
                  Text(
                    '${maxTemp}\u00BA/${minTemp}\u00BA Feels Like ${feelsLike}\u00BA',
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
      },
    );
  }
}
/* Column(
          children: [
            // Row(
            //   children: [
            //     Text(
            //       '33',
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     ),
            //     Icon(
            //       Icons.sunny,
            //       size: 30.0,
            //       color: Colors.yellow,
            //     ),
            //   ],
            // ),
            Text(
              //todo
              'City Name',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ],
        ),*/
