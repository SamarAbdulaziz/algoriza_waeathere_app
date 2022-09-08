import 'package:dio/dio.dart';
import 'package:weather/core/errors/error_model.dart';
import 'package:weather/core/errors/exceptions.dart';
import 'package:weather/core/utiles/constants.dart';
import 'package:weather/features/weather/data/models/new_weather_model.dart';


abstract class BaseRemoteDataSourceNew {
  Future<NewWeatherModel> getWeatherByCityName(String cityName);
}


class RemoteDataSourceNew implements BaseRemoteDataSourceNew {

  @override
  Future<NewWeatherModel> getWeatherByCityName(String cityName) async {
    var dio = Dio();
    final response =
        await dio.get(AppConstants.getWeatherByCityNamePathNew(cityName));
    //debugPrint(response.data);
    if (response.statusCode == 200) {
      return NewWeatherModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

}
