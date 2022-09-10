import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entities/forcast_days.dart';

class Forecast extends Equatable {
  final List<Forecastday> forecastDay;

  const Forecast({
    required this.forecastDay,
  });

  @override
  List<Object> get props => [forecastDay];
}


