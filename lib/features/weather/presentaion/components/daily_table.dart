import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_details_cubit.dart';
import '../controllers/weather_details_state.dart';

class DailyTable extends StatefulWidget {
  const DailyTable({Key? key}) : super(key: key);

  @override
  State<DailyTable> createState() => _DailyTableState();
}

class _DailyTableState extends State<DailyTable> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherDetailsCubit>(context).getWeatherDetailsByCityName('Alexandria');

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
        }
        else if (state is WeatherDetailsLoadedState) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: AppColors.whiteWithOpacity,
                borderRadius: BorderRadius.circular(20.0)),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              itemCount: 5,
              itemBuilder: (context, index) {
                var list = state.fiveDaysWeather.listOfFiveDays;
                var item = list[index];

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('day'),
                        Text('${item.pop}% '),
                        const Icon(
                          Icons.circle,
                          color: Colors.yellow,
                        ),
                        const Icon(
                          Icons.dark_mode,
                          color: Colors.yellow,
                        ),
                        Text('${item.maxTemp}\u00BA'),
                        Text('${item.minTemp}\u00BA'),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                  ],
                );
              },
            ),
          );
        }
        else {
          return const SizedBox();
        }
      },
    );
  }
}
