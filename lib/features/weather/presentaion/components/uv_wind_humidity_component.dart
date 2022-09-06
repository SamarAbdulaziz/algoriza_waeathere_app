import 'package:flutter/material.dart';
import 'package:weather/core/utiles/app_colors.dart';

class UvWindHumidityComponent extends StatelessWidget {
  const UvWindHumidityComponent({Key? key, required this.windSpeed, required this.humidity}) : super(key: key);
  final int windSpeed;
  final int humidity;

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
                style: const TextStyle(fontSize: 14.0, color: Colors.grey),
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
                '${windSpeed}km/h',
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
                '${humidity}%',
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
  }
}
