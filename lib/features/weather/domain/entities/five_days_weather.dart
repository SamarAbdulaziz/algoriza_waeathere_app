import 'package:equatable/equatable.dart';
import 'five_days_details.dart';

class FiveDaysWeather extends Equatable {
  final String code;
  final List<FiveDaysDetails> listOfFiveDays;
  final int id;
  final String cityName;
  final String country;
  final String sunrise;
  final String sunset;

  const FiveDaysWeather(
      {required this.code,
        required this.listOfFiveDays,
        required this.id,
        required this.cityName,
        required this.country,
        required this.sunrise,
        required this.sunset});

  @override
  List<Object> get props => [
    code,
    listOfFiveDays,
    id,
    cityName,
    country,
    sunrise,
    sunset,
  ];
}
