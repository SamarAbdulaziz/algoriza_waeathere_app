import 'package:flutter/material.dart';
import 'package:weather/core/utiles/app_colors.dart';

class SunriseSunsetComponent extends StatelessWidget {
  final String sunrise;
  final String sunset;

  const SunriseSunsetComponent(
      {Key? key, required this.sunrise, required this.sunset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const Text(
                'Sunrise',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                sunrise,
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
                sunset,
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
  }
}
