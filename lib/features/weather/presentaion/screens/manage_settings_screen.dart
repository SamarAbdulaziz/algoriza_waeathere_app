import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';
import 'package:weather/features/weather/presentaion/screens/weather_screen.dart';

class ManageSettingsScreen extends StatelessWidget {
  ManageSettingsScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NewWeatherCubit>(context);
    void _onTextFieldSubmitted(String value) {
      cubit.getWeatherByCityName(value);
      searchController.clear();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherScreen(),
        ),
      );
    }

    return BlocBuilder<NewWeatherCubit, NewWeatherStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.blueAppColor,
          appBar: AppBar(
            backgroundColor: AppColors.blueAppColor,
            elevation: 0.0,
            title: const Text('Manage Locations'),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: searchController,
              style: const TextStyle(color: Colors.black),
              onFieldSubmitted: (String value) {
                searchController.text = value;
                // debugPrint(searchController.text);
                // cubit.getWeatherByCityName(searchController.text);
                // searchController.clear();
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => WeatherScreen(),
                //   ),
                // );
                _onTextFieldSubmitted(value);
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                // fillColor: Colors.grey[500],
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
/*// onChanged: (value) {
              //   //debugPrint(value);
              //   //cubit.getWeatherByCityName(cubit.searchController.text);
              //   //cubit.getWeatherByCityName(value);
              // },
              // onSaved: (value) {
              //   //searchController.text = value!;
              // },*/