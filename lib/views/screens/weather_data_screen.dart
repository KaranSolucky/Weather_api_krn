import 'package:flutter/material.dart';
import 'package:karan_weather_app/views/widgets/smoke_animation.dart';
import 'package:provider/provider.dart';
import 'package:karan_weather_app/views/widgets/sun_animation_widget.dart';

import '../../controller/weather_provider.dart';
import '../../model/current_weather_model/current_weather_model.dart';
import '../widgets/search_widget.dart';
import '../widgets/weather_graph.dart';
import '../widgets/weather_hours.dart';

class WeatherDataScreen extends StatelessWidget {
  const WeatherDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentWeatherModel? weatherData =
        Provider.of<WeatherProvider>(context).weatherData;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: const Color(0xFF4255A6),
            title: weatherData!.weatherModel.description == "smoke"
                ? SmokeAnimationWidget()
                : SunAnimationWidget(),
            centerTitle: true,
            elevation: 0,
          ),
          body: Provider.of<WeatherProvider>(context).weatherData == null ||
                  Provider.of<WeatherProvider>(context).weatherTemp == null
              ? const Center(
                  child: SunAnimationWidget(),
                  //CircularProgressIndicator.adaptive(),
                )
              : SingleChildScrollView(
                  child: Container(
                    //height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        //borkne clouds
                        //haze
                        //overcast cloud - alaska

                        colors: weatherData.weatherModel.description == "smoke"
                            ? [
                                Color.fromARGB(255, 141, 159, 210),
                                Color.fromARGB(255, 86, 90, 103),
                              ]
                            : [
                                Color.fromARGB(255, 246, 183, 11),
                                Color.fromARGB(255, 164, 102, 68),
                              ],
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SearchWidget(),
                          const SizedBox(height: 3),
                          Text(weatherData.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Joan-Regular',
                                  fontWeight: FontWeight.w900)),
                          Text("${weatherData.mainModel.temp.toInt() - 273}°",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontFamily: 'Joan-Regular')),
                          const SizedBox(height: 3),
                          Text(weatherData.weatherModel.description,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Joan-Regular',
                                  fontWeight: FontWeight.bold)),
                          Text(
                            'H: ${weatherData.mainModel.temp_max.toInt() - 273}°   L: ${weatherData.mainModel.temp_min.toInt() - 273}°',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Joan-Regular'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const WeatherHours(),
                          const SizedBox(
                            height: 10,
                          ),
                          WeatherGraph(),
                          SizedBox(
                            height: 200,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}
