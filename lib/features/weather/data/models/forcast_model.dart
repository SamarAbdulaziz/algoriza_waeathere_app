import 'package:weather/features/weather/data/models/forcast_days_model.dart';
import 'package:weather/features/weather/domain/entities/forcast.dart';
import 'package:weather/features/weather/domain/entities/forcast_days.dart';

class ForecastModel extends Forecast {
  const ForecastModel({
    required final List<Forecastday> forecastDay,
  }) : super(
    forecastDay: forecastDay,
        );

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
    forecastDay: List<Forecastday>.from(
            json["forecastday"].map((x) => ForecastdayModel.fromJson(x))),
      );
}
