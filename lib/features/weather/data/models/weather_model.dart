// import 'package:intl/intl.dart';
// import 'package:weather/core/utiles/converrtTimeatampToDay.dart';
// import 'package:weather/features/weather/domain/entities/weather.dart';
//
// class WeatherModel extends Weather {
//   const WeatherModel({
//     required final int id,
//     required final int code,
//     required final String cityName,
//     required final String mainDescription,
//     required final String description,
//     required final String icon,
//     required final int temp,
//     required final int feelsLike,
//     required final int minTemp,
//     required final int maxTemp,
//     required final int pressure,
//     required final int humidity,
//     required final int windSpeed,
//     required final String sunrise,
//     required final String sunset,
//   }) : super(
//           code: code,
//           id: id,
//           cityName: cityName,
//           mainDescription: mainDescription,
//           description: description,
//           icon: icon,
//           temp: temp,
//           feelsLike: feelsLike,
//           minTemp: minTemp,
//           maxTemp: maxTemp,
//           pressure: pressure,
//           humidity: humidity,
//           //(%)
//           windSpeed: windSpeed,
//           sunrise: sunrise,
//           sunset: sunset,
//         );
//
//   factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
//         code: json['cod'],
//         id: json['id'],
//         cityName: json['name'],
//         mainDescription: json['weather'][0]['main'],
//         description: json["weather"][0]["description"],
//         icon: json["weather"][0]["icon"],
//         temp: json['main']['temp'].round(),
//         feelsLike: json['main']['feels_like'].round(),
//         minTemp: json['main']['temp_min'].round(),
//         maxTemp: json['main']['temp_max'].round(),
//         pressure: json['main']['pressure'],
//         humidity: json['main']['humidity'],
//         //(%)
//         windSpeed: (json['wind']['speed'] * 3.6).round(),
//         sunrise: convertTimestampIntoDatetime(json['sys']['sunrise']),
//         sunset: convertTimestampIntoDatetime(json['sys']['sunset']),
//       );
// }
//
//
//
// //
// // var timestamp = 1662089807;
// //
// // var ff= DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
// // print(ff);
