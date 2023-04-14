import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karan_weather_app/controller/weather_provider.dart';
import 'package:karan_weather_app/model/current_weather_model/current_weather_model.dart';
import 'package:karan_weather_app/model/five_day_model.dart/five_day_model.dart';
import 'package:karan_weather_app/model/weather_api.dart';
import 'package:karan_weather_app/views/screens/weather_data_screen.dart';

class SearchWidget extends StatelessWidget {
  String? cityName;

  SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      onChanged: (data) {
        cityName = data;
      },
      onSubmitted: (data) async {
        cityName = data;

        CurrentWeatherModel? weather =
            await WeatherApi.getCurrentData(cityName: cityName!);

        Provider.of<WeatherProvider>(context, listen: false).weatherData =
            weather;
        Provider.of<WeatherProvider>(context, listen: false).cityName =
            cityName;

        // get data from provider of next five day

        FiveDayModel weatherTemp =
            await WeatherApi.getFiveDayTemp(cityName: cityName!);
        Provider.of<WeatherProvider>(context, listen: false).weatherTemp =
            weatherTemp;
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const WeatherDataScreen()));
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          suffixIcon: const Icon(Icons.search, color: Colors.white),
          filled: true,
          fillColor: const Color(0xFF08244F),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Enter your city for search',
          hintStyle:
              const TextStyle(color: Colors.white, fontFamily: 'Joan-Regular')),
    );
  }
}
