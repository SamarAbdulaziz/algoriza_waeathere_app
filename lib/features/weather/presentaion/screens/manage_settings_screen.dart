import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/weather_cubit.dart';
import 'package:weather/features/weather/presentaion/screens/weather_screen.dart';

class ManageSettingsScreen extends StatelessWidget {
  const ManageSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<WeatherCubit>(context);
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.blueAppColor,
            title: const Text('Manage Locations'),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherScreen()));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: cubit.searchController,
              onChanged: (value) {
                print(value);
                //cubit.getWeatherByCityName(cubit.searchController.text);
                //cubit.getWeatherByCityName(value);
              },
              onSaved: (value) {
                cubit.searchController.text = value!;
              },
              onFieldSubmitted: (String value) {
                cubit.getWeatherByCityName(value);
                cubit.searchController.clear();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherScreen(),
                  ),
                );
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: () {},
            ),
          ),
        );
      },
    );
  }
}
/*  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherScreen(),
                  ),
                );*/
