import 'package:weather/core/utiles/converrtTimeatamp.dart';
import 'package:weather/features/weather/data/models/five_days_details_model.dart';
import 'package:weather/features/weather/domain/entities/five_days_weather.dart';
import 'package:weather/features/weather/domain/entities/five_days_details.dart';

class FiveDayWeatherModel extends FiveDaysWeather {
  const FiveDayWeatherModel({
    required final String code,
    required final List<FiveDaysDetails> listOfFiveDays,
    required final int id,
    required final String cityName,
    required final String country,
    required final String sunrise,
    required final String sunset
  }) :super(
    code: code,
    listOfFiveDays:listOfFiveDays,
    id: id,
    cityName: cityName,
    country: country,
    sunrise: sunrise,
    sunset: sunset,


  );

  factory FiveDayWeatherModel.fromJson(Map<String, dynamic> json) {
    return FiveDayWeatherModel(
      code: json['cod'],
     listOfFiveDays:List<FiveDaysDetails>.from(json['list'].map((e)=>ListOfFiveDaysModel.fromJson(e))) ,
     id: json['city']['id'],
      cityName: json['city']['name'],
      country: json['city']['country'],
      sunrise: convertTimestampIntoDatetime(json['city']['sunrise']),
      sunset: convertTimestampIntoDatetime(json['city']['sunset']),

    );
  }


}
//      genres:List<GenresModel>.from(json['genres'].map((e)=>GenresModel.fromJson(e))),