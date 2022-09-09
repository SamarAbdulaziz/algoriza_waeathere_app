import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/features/weather/domain/entities/hour.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';

class HourlyChart extends StatelessWidget {
  const HourlyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewWeatherCubit, NewWeatherStates>(
      builder: (context, state) {
        if (state is NewWeatherLoadedState) {
          List<Hour> hour = state.newWeather.forecast.forecastDay[0].hour;

          return SizedBox(
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            child: SfCartesianChart(
              plotAreaBorderColor: Colors.transparent,
              enableAxisAnimation: false,
              enableMultiSelection: true,
              primaryXAxis: CategoryAxis(
                isVisible: false,
                visibleMinimum: 0,
                 visibleMaximum: 5,
              ),
              zoomPanBehavior: ZoomPanBehavior(
                enablePanning: true,
              ),
              primaryYAxis: NumericAxis(
                isVisible: false,
                interval: 0.1,
                // desiredIntervals: 5,
              ),
              series: <ChartSeries>[
                LineSeries<Hour, String>(
                    dataSource: hour,
                    xValueMapper: (Hour hour, _) => hour.timeEpoch,
                    yValueMapper: (Hour hour, _) => hour.tempC,
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      width: 5.0,
                      height: 5.0,
                    ),
                    enableTooltip: true,
                    color: Colors.white60,
                ),
              ],

              // series: ,
            ),
          );
        }
        else if (state is NewWeatherErrorState) {
          return Text(state.errorMessage);}
        else {
          return Container();
        }
      },
    );
  }
}
