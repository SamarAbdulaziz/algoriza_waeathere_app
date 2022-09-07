import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/services/service_locator.dart';
import 'features/weather/presentaion/controllers/bloc_observer.dart';
import 'my_app.dart';

void main() async {
  ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const WeatherApp());
}

