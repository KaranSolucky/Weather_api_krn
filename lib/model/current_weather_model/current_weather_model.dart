import 'package:karan_weather_app/model/current_weather_model/weather_model.dart';
import 'main_model.dart';

class CurrentWeatherModel {
  WeatherModel weatherModel;
  MainModel mainModel;
  String name;

  CurrentWeatherModel(
      {required this.weatherModel,
      required this.mainModel,
      required this.name});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> data) {
    return CurrentWeatherModel(
        weatherModel: WeatherModel.fromJson(data['weather'][0]),
        mainModel: MainModel.fromJson(data["main"]),
        name: data['name']);
  }
}
