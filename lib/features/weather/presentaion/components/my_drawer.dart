import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utiles/app_colors.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_cubit.dart';
import 'package:weather/features/weather/presentaion/controllers/new_weather_state.dart';
import 'package:weather/features/weather/presentaion/screens/manage_settings_screen.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewWeatherCubit, NewWeatherStates>(
      builder: (context, state) {
        if (state is NewWeatherLoadedState) {
          return Drawer(
            backgroundColor: AppColors.blueAppColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                22.0,
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  top: 80.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: const[
                         Spacer(),
                         Icon(Icons.settings),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star_rounded,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Favorite location',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.info_outline),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Icon(
                          Icons.location_on,
                          size: 14.0,
                        ),
                        Text(
                          state.newWeather.location.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.circle,
                          color: Colors.yellow,
                        ),
                        Text('${state.newWeather.current.tempC}\u00BA'),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.7,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.add_location_outlined,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Other locations',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.info_outline),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 20.0,
                        ),
                        Icon(
                          Icons.location_on,
                          size: 14.0,
                        ),
                        Text(
                          'City Name',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.circle,
                          color: Colors.yellow,
                        ),
                        Text('33\u00BA'),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const ManageSettingsScreen(),
                          ),
                        );
                      },
                      color: AppColors.whiteWithOpacity,
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          22.0,
                        ),
                      ),
                      child: const Text(
                        'Manage locations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.7,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.info_outline_rounded,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Report Wrong Location',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.headset_mic_outlined,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        else {
          return const Drawer();
        }
      },
    );
  }
}
